# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id                  :bigint(8)        not null, primary key
#  title               :string
#  body                :text
#  anonymous           :boolean
#  user_id             :bigint(8)
#  course_id           :bigint(8)
#  teaching_session_id :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
