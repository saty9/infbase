# frozen_string_literal: true

# == Schema Information
#
# Table name: interests
#
#  id                  :bigint           not null, primary key
#  teaching_session_id :bigint
#  user_id             :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Interest < ApplicationRecord
  belongs_to :teaching_session
  belongs_to :user
end
