class Course < ApplicationRecord
  has_many :course_members
  has_many :questions
end
