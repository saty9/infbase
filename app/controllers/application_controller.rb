# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  before_action :authenticate_user!
  respond_to :json
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def user_not_authorized
    render json: {
        errors: [
            {
                status: '403',
                title: 'You are not authorized to perform this action.',
                code: '100'
            }
        ]
    }, status: :forbidden
  end
end
