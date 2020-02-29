# frozen_string_literal: true

class InterestsController < ApplicationController
  def index
    render json: Interest.where(teaching_session_id: params[:session_id])
  end

  def create
    @interest = current_user.interests.new(interest_params)
    if !current_user.interests.where(interest_params).exists?
      @interest.save
      render json: @interest.teaching_session.interests
    else
      render json: @interest.teaching_session.interests
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
  end

  private

  def interest_params
    params.require(:interest).permit(:teaching_session_id)
  end
end
