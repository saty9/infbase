# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
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
#

class User < ApplicationRecord
  # include Rails.application.routes.url_helpers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  enum role: %i[student tutor admin].freeze

  has_many :answers
  has_many :interests
  has_many :questions
  has_many :expertises
  has_many :course_members
  has_many :teaching_sessions
  has_many :courses, through: :course_members
  has_many :reports, through: :teaching_sessions
  has_one_attached :avatar

  def attributes
    { id: id, email: email, role: role, first_name: first_name, last_name: last_name, biography: biography }
  end

  # def attach_image
  #   image_url = ''
  #   ActiveStorage::Current.set(host: "localhost:3000") do
  #     image_url = rails_blob_url(avatar)
  #   end
  #   as_json.merge(avatar: image_url)
  # end

  def full_name
    "#{first_name} #{last_name}"
  end
end
