# frozen_string_literal: true

class TeachingSessionsController < ApplicationController
  def index
    if params[:range]
      range = params[:range]
      start = range.first.to_date
      finish = range.last.to_date + 1.day
      render json: TeachingSession.in_range(start, finish).map(&:to_json)
    else
      render json: TeachingSession.all.map(&:to_json)
    end
  end

  def show
    @session = TeachingSession.find(params[:id])
  end
end
