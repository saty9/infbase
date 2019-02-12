# frozen_string_literal: true

class TeachingSessionsController < ApplicationController
  def index
    if params[:range]
      range = params[:range].map { |date| JSON.parse(date) }
      p start = Date.new(*range.first)
      p finish = Date.new(*range.last) + 1.day
      render json: TeachingSession.in_range(start, finish).map(&:to_json)
    else
      render json: TeachingSession.all.map(&:to_json)
    end
  end

  def show
    @session = TeachingSession.find(params[:id])
  end
end
