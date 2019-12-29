# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show update destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show; end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    authorize @answer
    if @answer.save
      @answer.question.update(resolved: true)
      render json: @answer.as_json, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    authorize @answer
    if @answer.update(answer_params)
      @answer.question.update(resolved: true)
      render :show, status: :ok, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    question = @answer.question
    authorize @answer
    @answer.destroy
    # un-set resolved flag if no answers left
    unless question.answers.exists?
      question.update(resolved: false)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end
