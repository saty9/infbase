# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
  has_many :report_topics
end
