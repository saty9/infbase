# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  before_action :authenticate_user!, only: :check_login

  def check_login
    render json: current_user
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
