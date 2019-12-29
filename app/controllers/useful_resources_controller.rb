class UsefulResourcesController < ApplicationController
  before_action :set_useful_resource, only: [:show, :update, :destroy, :vote_for, :remove_vote]

  # GET /useful_resources
  def index
    if params[:course_id]
      @useful_resources = UsefulResource.where(course_id: params[:course_id])
    else
      @useful_resources = UsefulResource.all
    end
    unless current_user.is_staff?
      @useful_resources = @useful_resources.where(restricted: false)
    end

    @useful_resources = @useful_resources.order("votes")
    @user_votes = ResourceVote.where(user: current_user)
    authorize @useful_resources
    render json: [@useful_resources.as_json(
        include: {
          useful_resource_attachments: {only: [:id], methods: [:file]}
        }
      ),
    @user_votes.as_json(only: [:id, :useful_resource_id])
    ]
  end

  # GET /useful_resources/1
  def show
    authorize @useful_resource
    render json: @useful_resource
  end

  # POST /useful_resources
  def create
    @useful_resource = UsefulResource.new(useful_resource_params)
    authorize @useful_resource
    if @useful_resource.save
      render json: @useful_resource, status: :created, location: @useful_resource
    else
      render json: @useful_resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /useful_resources/1
  def update
    authorize @useful_resource
    if @useful_resource.update(useful_resource_params)
      render json: @useful_resource
    else
      render json: @useful_resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /useful_resources/1
  def destroy
    authorize @useful_resource
    @useful_resource.destroy
  end

  def vote_for
    ResourceVote.find_or_create_by(useful_resource: @useful_resource, user: current_user)
  end

  def remove_vote
    ResourceVote.where(useful_resource: @useful_resource, user:current_user).destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useful_resource
      @useful_resource = UsefulResource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def useful_resource_params
      params.require(:useful_resource).permit(:body, :course_id, :restricted)
    end
end
