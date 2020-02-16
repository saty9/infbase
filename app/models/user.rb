# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  role                   :integer          default("student"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  biography              :string
#
require 'devise/strategies/authenticatable'

module Devise
  module Models
    module RemoteAuthenticable
      extend ActiveSupport::Concern

      module ClassMethods
        def serialize_from_session(id)
          resource = self.new
          resource.id = id
          resource
        end

        def serialize_into_session(record)
          [record.id]
        end

      end

      def remote_authentication(authentication_hash)
        # TODO pull in first and last name and email from a server if that's possible

        if (authentication_hash != nil && authentication_hash != "")
          self.first_name="remote"
          self.last_name="record"
          self.email=authentication_hash+ "@remote.com"
          self.password=(0...50).map { ('a'..'z').to_a[rand(26)] }.join
          return self.save!
        else
          return false
        end
      end
    end
  end

  module Strategies
    class RemoteAuthenticatable < Authenticatable
      #
      # For an example check : https://github.com/plataformatec/devise/blob/master/lib/devise/strategies/database_authenticatable.rb
      #

      # this strategy is only valid when accessing login path
      def valid_for_http_auth?
        env['REQUEST_PATH'] == '/api/login'
      end

      def valid_for_params_auth?
        false
      end
      # Method called by warden to authenticate a resource.
      #
      def authenticate!
        auth_params = env['REMOTE_USER']

        #
        # mapping.to is a wrapper over the resource model
        #
        if auth_params
          created = false
          resource = mapping.to.find_or_create_by(remoteid: auth_params) do |new_object|
            created = true
          end
          if created # pull in user data
            resource.remote_authentication(auth_params)
          end
        else
          return pass!
        end

        return fail! unless resource

        # remote_authentication method is defined in Devise::Models::RemoteAuthenticatable
        #
        # validate is a method defined in Devise::Strategies::Authenticatable. It takes
        #a block which must return a boolean value.
        #
        # If the block returns true the resource will be loged in
        # If the block returns false the authentication will fail!
        #
        if validate(resource)
          success!(resource)
        end
      end
    end
  end

end

class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :remote_authenticable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  enum role: %i[student tutor admin].freeze

  has_many :answers
  has_many :interests
  has_many :questions
  has_many :question_votes
  has_many :expertises, foreign_key: :tutor_id
  has_many :course_members
  has_many :teaching_sessions, foreign_key: :tutor_id
  has_many :courses, through: :expertises
  has_many :reports, through: :teaching_sessions
  has_one_attached :avatar

  def attributes
    { id: id, email: email, role: role, first_name: first_name, last_name: last_name, biography: biography }
  end

  def attach_info
    courses = expertises.joins(:course).pluck(:name)
    as_json.merge(courses: courses, avatar: (rails_blob_url(avatar) if avatar.attached?))
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_staff?
    role == "admin" or role == "tutor"
  end
end
