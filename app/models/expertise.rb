# frozen_string_literal: true

# == Schema Information
#
# Table name: expertises
#
#  id         :bigint(8)        not null, primary key
#  course_id  :bigint(8)
#  tutor_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Expertise < ApplicationRecord
  belongs_to :course
  belongs_to :user, class_name: "User", foreign_key: "tutor_id"

  def to_json
    {id: id, tutor_id: tutor_id, course_id: course_id, name: course.name}
  end
end
