# frozen_string_literal: true

# == Schema Information
#
# Table name: question_tags
#
#  id          :bigint           not null, primary key
#  topic_id    :bigint
#  question_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionTag < ApplicationRecord
  belongs_to :topic
  belongs_to :question
end
