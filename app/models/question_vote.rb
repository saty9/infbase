# frozen_string_literal: true

# == Schema Information
#
# Table name: question_votes
#
#  id          :bigint(8)        not null, primary key
#  question_id :bigint(8)
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  value       :integer          default(1)
#

class QuestionVote < ApplicationRecord
  belongs_to :question
  belongs_to :user
end
