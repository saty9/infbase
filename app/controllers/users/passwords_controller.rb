# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  respond_to :json

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    render json: { message: (I18n.t 'devise.passwords.send_instructions') }
  end
end