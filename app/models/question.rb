# frozen_string_literal: true
# == Schema Information
#
# Table name: questions
#
#  id                  :bigint(8)        not null, primary key
#  title               :string
#  body                :text
#  anonymous           :boolean
#  user_id             :bigint(8)
#  course_id           :bigint(8)
#  teaching_session_id :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  views               :integer          default(0)
#  votes               :integer          default(0)
#

require 'elasticsearch/model'

class Question < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  belongs_to :course
  belongs_to :teaching_session, optional: true

  has_many :answers
  has_many :question_tags
  has_many :topics, through: :question_tags
  has_many :question_votes
  scope :user, -> (user_id) { where user_id: user_id }
  scope :course, -> (course_id) { where course_id: course_id}
  scope :tagged_with, -> (tag_ids) { joins(:question_tags).where( 'question_tags.topic_id': tag_ids ) }
  scope :asked_since, -> (date) {where 'questions.created_at >= ?', date}
end
