class ReportTopic < ApplicationRecord
  belongs_to :report
  belongs_to :topic
end
