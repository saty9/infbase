class UsefulResourcePolicy < ApplicationPolicy
  attr_reader :user, :useful_resource

  def initialize(user, useful_resource)
    @user = user
    @useful_resource = useful_resource
  end

  def index?
    true
  end

  def show?
    if user.is_staff?
      true
    else
      not useful_resource.restricted
    end
  end

  def create?
    user.is_staff?
  end

  def update?
    user.is_staff?
  end

  def destroy?
    user.is_staff?
  end

end