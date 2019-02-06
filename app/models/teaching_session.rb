# == Schema Information
#
# Table name: teaching_sessions
#
#  id         :bigint(8)        not null, primary key
#  start_time :time
#  tutor_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeachingSession < ApplicationRecord
  belongs_to :tutor, class_name: :user

  has_many :questions
  has_many :interests
  has_one :report
end
