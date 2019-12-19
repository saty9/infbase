# frozen_string_literal: true

# == Schema Information
#
# Table name: expertises
#
#  id         :bigint           not null, primary key
#  course_id  :bigint
#  tutor_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Expertise < ApplicationRecord
  belongs_to :course
  belongs_to :tutor, foreign_key: 'tutor_id', class_name: 'User'

  def to_json
    { id: id, tutor_id: tutor_id, course_id: course_id, name: course.name }
  end
end
