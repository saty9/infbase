# == Schema Information
#
# Table name: question_tags
#
#  id          :bigint(8)        not null, primary key
#  topic_id    :bigint(8)
#  question_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionTag < ApplicationRecord
  belongs_to :topic
  belongs_to :question
end
