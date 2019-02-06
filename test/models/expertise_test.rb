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

require 'test_helper'

class ExpertiseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
