# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    render json: Course.all.as_json(only: [:id,:name])
  end

  def stats
    @courses = Course.joins(:questions).merge(Question.asked_since(params[:since]))
    @courses = @courses.group('courses.id').select('SUM(questions.votes) AS vote_count','name','id', 'COUNT(questions)')
    render json: @courses.as_json
  end

  def show; end
end
