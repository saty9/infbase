# == Schema Information
#
# Table name: interests
#
#  id                  :bigint(8)        not null, primary key
#  teaching_session_id :bigint(8)
#  user_id             :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Interest < ApplicationRecord
  belongs_to :teaching_session
  belongs_to :user
end
