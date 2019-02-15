# frozen_string_literal: true

# == Schema Information
#
# Table name: hours
#
#  id         :bigint(8)        not null, primary key
#  start      :time
#  end        :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hour < ApplicationRecord
  has_many :teaching_sessions
end
