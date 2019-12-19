# frozen_string_literal: true

# == Schema Information
#
# Table name: course_members
#
#  id         :bigint           not null, primary key
#  role       :integer
#  user_id    :bigint
#  course_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CourseMember < ApplicationRecord
  belongs_to :user
  belongs_to :course
  enum role: %i[student tutor]
end
