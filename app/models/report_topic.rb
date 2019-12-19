# frozen_string_literal: true

# == Schema Information
#
# Table name: report_topics
#
#  id         :bigint           not null, primary key
#  report_id  :bigint
#  topic_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class ReportTopic < ApplicationRecord
  belongs_to :report
  belongs_to :topic
end
