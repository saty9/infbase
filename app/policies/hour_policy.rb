class HourPolicy < ApplicationPolicy
  attr_reader :user, :hour

  def initialize(user, hour)
    @user = user
    @hour = hour
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.role == "admin"
  end

  def update?
    user.role == "admin"
  end

  def destroy?
    user.role == "admin"
  end

end