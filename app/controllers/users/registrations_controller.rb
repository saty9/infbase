# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def show
    render json: current_user.attach_image
  end

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end

  private
  def update_resource(resource, params)
    # debugger
    resource.avatar.attach(io: params[:avatar], filename: 'some_name')
    resource.update_without_password(params)
    render json: resource
  end

  def sign_up_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :biography, :avatar)
  end
end
