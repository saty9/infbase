# == Schema Information
#
# Table name: question_followups
#
#  id                   :bigint           not null, primary key
#  question_id          :bigint
#  question_followup_id :bigint
#  body                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class QuestionFollowup < ApplicationRecord
  belongs_to :question
  belongs_to :parent, class_name: "QuestionFollowup", optional: true, :foreign_key => "question_followup_id"
end
