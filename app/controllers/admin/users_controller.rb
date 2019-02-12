# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  respond_to :json

  def index
    if params['roles']
      render json: User.where(role: params['roles'])
    else
      render json: User.all
    end
  end

  def update
    @user = User.find(params[:id])
    p params[:user]

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(update_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def update_params
    params.require(:user).permit(:first_name, :last_name, :role)
  end
end
