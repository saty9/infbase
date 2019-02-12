# frozen_string_literal: true

class CoursesController < ApplicationController

  def index
    render json: Course.all
  end
  
  def show; end
end
