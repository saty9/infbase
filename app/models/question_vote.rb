# frozen_string_literal: true

# == Schema Information
#
# Table name: question_votes
#
#  id          :bigint           not null, primary key
#  question_id :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  value       :integer          default(1)
#

class QuestionVote < ApplicationRecord
  after_commit :update_question
  belongs_to :question
  belongs_to :user

  def update_question
    if @_new_record_before_last_commit
      #creating
      question.increment!(:votes,value)
    elsif @destroyed
      #destroying
      question.decrement!(:votes,value)
    else
      #updating
      question.increment!(:votes,value - saved_changes[:value][0])
    end
  end
end
