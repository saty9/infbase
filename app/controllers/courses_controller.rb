# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    render json: Course.all.as_json(only: [:id,:name])
  end

  def show; end
end
