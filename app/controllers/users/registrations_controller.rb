# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  #prepend_before_action :authenticate_scope!, only: [:show, :show_user]
  respond_to :json

  def show
    render json: current_user.attach_info
  end

  def show_user
    render json: User.find(params[:id]).attach_info
  end

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource.avatar.attach(account_update_params[:avatar]) if account_update_params[:avatar]
    resource_updated = resource.update_without_password(account_update_params)
    yield resource if block_given?
    if resource_updated
      bypass_sign_in resource, scope: resource_name

      render json: resource.attach_info, status: 200
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :biography, :avatar)
  end
end
