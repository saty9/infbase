# == Schema Information
#
# Table name: answers
#
#  id          :bigint(8)        not null, primary key
#  body        :text
#  posted      :datetime
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint(8)
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
end
