# == Schema Information
#
# Table name: course_members
#
#  id         :bigint(8)        not null, primary key
#  role       :integer
#  user_id    :bigint(8)
#  course_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CourseMember < ApplicationRecord
  belongs_to :user
  belongs_to :course
  
  enum type: [:student, :tutor]
end
