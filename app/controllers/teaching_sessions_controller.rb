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

  def forecast
    first_day = params[:first_day].to_date
    finish = first_day + 5.days
    sessions = TeachingSession.in_range(first_day, finish)
    render json: sessions.as_json(methods: [:forecast_busyness, :start_hour])
  end

  def history
    authorize TeachingSession, :get_historical_stats?
    params.require(:range)
    @query = TeachingSession.where('start_date > ?',Date.today - params[:range].to_i.months)
    @query = @query.where('start_date < ?', Date.today)
    @query = @query.group(:dow).joins(:report,:hour).group(:start).average(:students)

    render json: @query
  end

end
