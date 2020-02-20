# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show update destroy vote_for remove_vote]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.where(nil)
    @questions = @questions.search(params[:search_string]).records if params[:search_string]
    @questions = @questions.left_joins(:answers).where(answers: {question_id: nil}) if params[:unanswered]
    @questions = @questions.joins(:answers) if params[:answered]
    @questions = @questions.user(current_user.id) if params[:asked_by_me]
    @questions = @questions.where(course: current_user.courses) if params[:user_courses]
    @questions = @questions.where(teaching_session: current_user.teaching_sessions.where('start_date >= ?', Date.today)) if params[:upcoming_session]
    @questions = @questions.course(params[:course]) if params[:course].present?
    @questions = @questions.tagged_with(params[:tag]) if params[:tag].present?
    @questions = @questions.all.select('votes AS vote_count', :title, :id, :views, :created_at, :resolved)
    case params[:order_by]
    when "vote_count"
      @questions = @questions.order('vote_count desc, questions.created_at desc')
    when "posted"
      @questions = @questions.order('questions.created_at desc')
    when "view_count"
      @questions = @questions.order('questions.views desc, questions.created_at desc')
    else
      @questions = @questions.order('vote_count desc, questions.created_at desc')
    end
    authorize @questions

    render json: @questions.as_json(include: {
                                      topics: { only: %i[id name] }
                                    })
  end

  def search
    @questions = Question.joins(:answers)
    @questions = @questions.search(params[:search_string], size: 4).records
    authorize @questions
    render json: @questions.as_json(only: [:id, :title])
  end

  def vote_for
    QuestionVote.find_or_create_by(question: @question, user: current_user, value: 1)
  end

  def remove_vote
    QuestionVote.where(question:@question, user_id:current_user.id).destroy_all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    Question.increment_counter(:views, @question.id)
    exposed_attributes = [:id, :title, :body, :created_at, :course_id, :votes, :updated_at, :user_id]
    out = @question.as_json(only:exposed_attributes,
                            include: {
                                topics: { only: %i[id name] },
                                answers: { only: %i[id body created_at updated_at user_role],
                                           include: :user },

                                question_followups: {only: [:id, :question_followup_id, :body]},
                            })
    out[:voted] = @question.question_votes.where(user:current_user).exists?
    authorize @question
    render json: out
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    authorize @question
    @question.user = current_user

    if @question.save
      params[:tags].each do |tag|
        if tag.is_a? ActionController::Parameters
          if not tag[:id]
            topic = Topic.where(name: tag[:name].titleize).first_or_create(name: tag[:name].titleize)
            tag_id = topic.id
          else
            tag_id = tag[:id]
          end
        else
          next
        end
        QuestionTag.create(question: @question, topic_id: tag_id)
      end
      if current_user.role != "student"
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
    authorize @question
    if @question.update(question_params)
      render :show, status: :ok, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    authorize @question
    @question.question_tags.destroy_all
    @question.question_votes.destroy_all
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
