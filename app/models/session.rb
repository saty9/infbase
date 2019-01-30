# == Schema Information
#
# Table name: sessions
#
#  id         :bigint(8)        not null, primary key
#  start_time :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Session < ApplicationRecord
  has_many :questions
end
