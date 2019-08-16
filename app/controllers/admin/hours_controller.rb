# frozen_string_literal: true

class Admin::HoursController < ApplicationController
  include Formatter
  before_action :set_hour, only: %i[update destroy]
  respond_to :json

  def index
    hours = Hour.all.as_json.map do |hour|
      formatted_hour hour
    end
    render json: hours
  end

  def create
    @hour = Hour.new(hour_params)
    authorize @hour

    if @hour.save
      render json: (formatted_hour @hour.as_json)
    else
      render json: @hour.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @hour
    if @hour.update(hour_params)
      render json: (formatted_hour @hour.as_json)
    else
      render json: @hour.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @hour
    @hour.destroy
  end

  private

  def set_hour
    @hour = Hour.find(params[:id])
  end

  def hour_params
    params.require(:hour).permit(:start, :end)
  end
end
