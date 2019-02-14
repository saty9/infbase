# frozen_string_literal: true

class Admin::TeachingSessionsController < ApplicationController
  before_action :set_session, only: %i[update destroy]

  def create
    @session = TeachingSession.new(session_params)

    if @session.save
      render json: @session.to_json
      if params[:occurrence] == 'weekly'
        p '==========================='
        TeachingSession.create_weekly(params: session_params, until_date: params[:until])
      end
      CreateReportJob.perform_async(@session)
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  def update
    if @session.update(session_params)
      render json: @session.to_json, status: :ok
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
  end

  private

  def set_session
    @session = TeachingSession.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:tutor_id, :hour_id, :start_date)
  end
end
