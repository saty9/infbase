# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id          :bigint(8)        not null, primary key
#  topic_id    :bigint(8)
#  report_id   :bigint(8)
#  question_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tag < ApplicationRecord
  belongs_to :topic
  belongs_to :report
  belongs_to :question
end
