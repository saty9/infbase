# frozen_string_literal: true

class InterestsController < ApplicationController
  def index
    render json: current_user.interests
  end

  def create
    @interest = current_user.interests.new(interest_params)
    @interest.save
    render json: current_user.interests
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
