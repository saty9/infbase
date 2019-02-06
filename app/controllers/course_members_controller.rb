# frozen_string_literal: true

class CourseMembersController < ApplicationController
  before_action :set_course_member, only: %i[show update destroy]

  # GET /course_members
  # GET /course_members.json
  def index
    @course_members = CourseMember.all
  end

  # GET /course_members/1
  # GET /course_members/1.json
  def show; end

  # POST /course_members
  # POST /course_members.json
  def create
    @course_member = CourseMember.new(course_member_params)

    if @course_member.save
      render :show, status: :created, location: @course_member
    else
      render json: @course_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /course_members/1
  # PATCH/PUT /course_members/1.json
  def update
    if @course_member.update(course_member_params)
      render :show, status: :ok, location: @course_member
    else
      render json: @course_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /course_members/1
  # DELETE /course_members/1.json
  def destroy
    @course_member.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_member
    @course_member = CourseMember.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_member_params
    params.require(:course_member).permit(:role, :user_id, :course_id)
  end
end
