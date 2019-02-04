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
#

class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :teaching_session

  has_many :answers
  has_many :tags
end
