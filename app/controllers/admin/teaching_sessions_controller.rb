# frozen_string_literal: true

class Admin::TeachingSessionsController < ApplicationController
  before_action :set_session, only: %i[update destroy]
  after_action :verify_authorized

  def create
    authorize TeachingSession
    @sessions = TeachingSession.create_with_type(params: session_params,
                                                 type: params[:occurrence],
                                                 until_date: params[:until])

    @session = @sessions.try(:first) || @sessions
    render json: @session.to_json
  end

  def update
    authorize @session
    TeachingSession.update_with_type(session: @session,
                                     type: params[:occurrence],
                                     params: session_params,
                                     until_date: params[:until])

    render json: set_session.to_json
  end

  def destroy
    authorize @session
    TeachingSession.destroy_with_type(session: @session,
                                      type: params[:occurrence],
                                      until_date: params[:until])
  end

  private

  def set_session
    @session = TeachingSession.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:tutor_id, :hour_id, :start_date)
  end
end
