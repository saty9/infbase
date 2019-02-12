# frozen_string_literal: true

class Users::RelatedController < ApplicationController
  before_action :set_user, only: %i[courses]
  respond_to :json

  def courses
    @course_memberships = @user.course_members
    render json: @course_memberships.as_json(include: {
        course: {only: [:name]}
    })
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
