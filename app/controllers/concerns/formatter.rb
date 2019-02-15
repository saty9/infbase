# frozen_string_literal: true

module Formatter
  def formatted_hour(hour)
    hour['start'] = hour['start'].to_s(:time)
    hour['end'] = hour['end'].to_s(:time)
    hour
  end
end
