class QuestionFollowupsController < ApplicationController
  before_action :set_question_followup, only: [:show, :update, :destroy]

  # GET /question_followups
  def index
    @question_followups = QuestionFollowup.all

    authorize @question_followups
    render json: @question_followups
  end

  # GET /question_followups/1
  def show
    authorize @question_followup
    render json: @question_followup
  end

  # POST /question_followups
  def create
    @question_followup = QuestionFollowup.new(question_followup_params)

    authorize @question_followup
    if @question_followup.save
      render json: @question_followup, status: :created, location: @question_followup
    else
      render json: @question_followup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /question_followups/1
  def update
    authorize @question_followup
    if @question_followup.update(question_followup_params)
      render json: @question_followup
    else
      render json: @question_followup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /question_followups/1
  def destroy
    authorize @question_followup
    @question_followup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_followup
      @question_followup = QuestionFollowup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_followup_params
      params.require(:question_followup).permit(:question_id, :question_followup_id, :body)
    end
end
