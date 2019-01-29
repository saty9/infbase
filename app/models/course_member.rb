class CourseMember < ApplicationRecord
  belongs_to :user
  belongs_to :course
  enum type: [:student, :tutor]
end
