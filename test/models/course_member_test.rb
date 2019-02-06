# frozen_string_literal: true

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

require 'test_helper'

class CourseMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
