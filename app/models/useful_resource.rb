# == Schema Information
#
# Table name: useful_resources
#
#  id         :bigint           not null, primary key
#  body       :text
#  course_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  restricted :boolean          default(FALSE), not null
#  votes      :integer          default(0)
#

class UsefulResource < ApplicationRecord
  belongs_to :course
  has_many :useful_resource_attachments
  has_many :resource_votes
  has_many :useful_resource_tags
  has_many :topics, through: :useful_resource_tags
end
