# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    render json: Course.all.as_json(only: [:id,:name])
  end

  def stats
    authorize Course
    @courses = Course.joins(:questions).merge(Question.asked_since(params[:since]))
    @courses = @courses.group('courses.id').select('SUM(questions.votes) AS vote_count','name','id', 'COUNT(questions)')
    render json: @courses.as_json
  end

  def show; end
end
