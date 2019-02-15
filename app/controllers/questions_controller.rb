# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show update destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.joins(:question_votes).group('questions.id').order('sum(question_votes.value) desc')
    @questions = if current_user
                   @questions.where(course: current_user.courses)
                 else
                   @questions.all
                 end

    render json: @questions.as_json(include: {
                                      topics: { only: %i[id name] }
                                    }, methods: :vote_count)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    render json: @question.as_json(include: {
                                     topics: { only: %i[id name] },
                                     answers: { only: %i[body created_at],
                                                include: :user }
                                   }, methods: :vote_count)
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      params[:tags].each do |tag|
        print(tag)
        if tag.is_a? String
          topic = Topic.find_or_create(name: tag.titleize)
          tag_id = topic.id
        else
          tag_id = tag[:id]
        end
        QuestionTag.create(question: @question, topic_id: tag_id)
      end
      if current_user.role != :student
        @question.answers.create(user: current_user, body: params[:answer])
        @question.question_votes.create(user: current_user, value: params[:interest])
      else
        @question.question_votes.create(user: current_user, value: 1)
      end
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if @question.update(question_params)
      render :show, status: :ok, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :body, :posted, :anonymous, :user_id, :course_id, :teaching_session_id)
  end
end
