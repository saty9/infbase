class UserPolicy < ApplicationPolicy
  attr_reader :user, :model_user

  def initialize(user, model_user)
    @user = user
    @model_user = model_user
  end

  def index?
    true
  end

  def show?
    true
  end

  def send_email?
    user.role == "admin"
  end

  def create?
    true
  end

  def update?
    model_user == user
  end

  def admin_update?
    user.role == "admin"
  end

  def destroy?
    user.role == "admin" or model_user == user
  end

end