# == Schema Information
#
# Table name: useful_resources
#
#  id         :bigint           not null, primary key
#  body       :text
#  course_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsefulResource < ApplicationRecord
  belongs_to :course
end
