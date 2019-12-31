# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
  has_many :report_topics
  has_many :question_tags
  has_many :questions, through: :question_tags
  has_many :useful_resource_tags
  has_many :useful_resources, through: :useful_resource_tags
end
