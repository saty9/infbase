# frozen_string_literal: true

class Admin::ExpertiseController < ApplicationController
  respond_to :json

  def index
    render json: Expertise.all.map(&:to_json)
  end

  def create
    @expertise = Expertise.new(expertise_params)

    if @expertise.save
      render json: @expertise.to_json, status: :ok
    else
      render json: @expertise.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expertise = Expertise.find(params[:id])
    @expertise.destroy
  end

  private

  def expertise_params
    params.require(:expertise).permit(:course_id, :tutor_id)
  end
end
