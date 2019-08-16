# frozen_string_literal: true

class Admin::CoursesController < ApplicationController
  before_action :set_course, only: %i[update destroy]

  def create
    @course = Course.new(course_params)
    authorize @course

    if @course.save
      render json: @course, status: :ok
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @course
    if @course.update(course_params)
      render json: @course, status: :ok
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @course
    @course.destroy
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name)
  end
end
