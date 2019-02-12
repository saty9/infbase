# frozen_string_literal: true

class HoursController < ApplicationController
  include Formatter
  
  def index
    hours = Hour.all.as_json.map do |hour|
      formatted_hour hour
    end
    render json: hours
  end
end
