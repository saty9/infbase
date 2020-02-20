# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  body        :text
#  user_id     :bigint
#  question_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_role   :int              not_null
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  before_create :set_user_role

  enum user_role: User.roles

  def set_user_role
    self.user_role = self.user.role
  end
end
