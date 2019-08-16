# frozen_string_literal: true

class Admin::ReportsController < ApplicationController
  respond_to :json, :csv
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
      ReportTopic.where(report_id: @report.id).destroy_all
      params['report']['topics'].each do |topic_name|
        topic = Topic.find_or_create_by(name: topic_name)
        report_topic = ReportTopic.find_or_create_by(report_id: @report.id, topic_id: topic.id)
      end
      render json: @report.merge_data, status: :ok
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def export_csv
    render json: Report.to_csv(Time.new - 20.day, Time.new)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:tutor_id, :teaching_session_id, :students, :comment)
  end
end
