# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id                  :bigint(8)        not null, primary key
#  students            :integer
#  comment             :text
#  tutor_id            :bigint(8)
#  teaching_session_id :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
