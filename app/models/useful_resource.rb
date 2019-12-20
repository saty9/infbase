# == Schema Information
#
# Table name: useful_resources
#
#  id         :bigint           not null, primary key
#  body       :text
#  course_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  restricted :boolean
#

class UsefulResource < ApplicationRecord
  belongs_to :course
  has_many :useful_resource_attachments
end
