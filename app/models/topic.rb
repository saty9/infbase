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
  has_many :tags
  has_many :question_tags
  has_many :questions, through: :question_tags
end
