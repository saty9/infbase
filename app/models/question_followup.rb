class QuestionFollowup < ApplicationRecord
  belongs_to :question
  belongs_to :parent, class_name: "QuestionFollowup", optional: true, :foreign_key => "question_followup_id"
end
