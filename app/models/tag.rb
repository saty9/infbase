class Tag < ApplicationRecord
  belongs_to :topic
  belongs_to :report
  belongs_to :question
end
