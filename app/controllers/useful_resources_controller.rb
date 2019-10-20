class UsefulResourcesController < ApplicationController
  before_action :set_useful_resource, only: [:show, :update, :destroy]

  # GET /useful_resources
  def index
    @useful_resources = UsefulResource.all
    authorize @useful_resources
    render json: @useful_resources
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useful_resource
      @useful_resource = UsefulResource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def useful_resource_params
      params.require(:useful_resource).permit(:body, :course_id)
    end
end
