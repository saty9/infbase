# frozen_string_literal: true

class Admin::ReportsController < ApplicationController
  before_action :set_report, only: %i[show update]

  def index
    if current_user.admin?
      render json: Report.past_reports.map(&:merge_data)
    else
      render json: Report.past_reports.of_tutor(current_user).map(&:merge_data)
    end
  end

  def show
    render json: @report.merge_data
  end

  def update
    if @report.update(report_params)
      @report.update(completed: true)
      render json: @report.merge_data, status: :ok
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:tutor_id, :teaching_session_id, :students, :comment)
  end
end
