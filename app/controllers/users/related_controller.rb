# frozen_string_literal: true

class Users::RelatedController < ApplicationController
  before_action :set_user
  respond_to :json

  def courses
    @course_memberships = @user.course_members
    render json: @course_memberships.as_json(include: {
        course: {only: [:name]}
    }
    )
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end
