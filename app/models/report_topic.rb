# frozen_string_literal: true

class ReportTopic < ApplicationRecord
  belongs_to :report
  belongs_to :topic
end
