class UsefulResourceAttachmentsController < ApplicationController
  before_action :set_useful_resource_attachment, only: [:show, :update, :destroy]

  # GET /useful_resource_attachments
  def index
    @useful_resource_attachments = UsefulResourceAttachment.all
    authorize @useful_resource_attachments
    render json: @useful_resource_attachments
  end

  # GET /useful_resource_attachments/1
  def show
    authorize @useful_resource_attachment
    render json: @useful_resource_attachment
  end

  # POST /useful_resource_attachments
  def create
    @useful_resource_attachment = UsefulResourceAttachment.new(creation_params)

    authorize @useful_resource_attachment
    if @useful_resource_attachment.save
      render json: @useful_resource_attachment, status: :created, location: @useful_resource_attachment
    else
      render json: @useful_resource_attachment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /useful_resource_attachments/1
  def update
    authorize @useful_resource_attachment
    if @useful_resource_attachment.update(useful_resource_attachment_params)
      render json: @useful_resource_attachment
    else
      render json: @useful_resource_attachment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /useful_resource_attachments/1
  def destroy
    authorize @useful_resource_attachment
    @useful_resource_attachment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useful_resource_attachment
      @useful_resource_attachment = UsefulResourceAttachment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def useful_resource_attachment_params
      params.require(:useful_resource_attachment).permit(:useful_resource, :document)
    end

    def creation_params
      params.permit(:useful_resource_id, :document)
    end
end
