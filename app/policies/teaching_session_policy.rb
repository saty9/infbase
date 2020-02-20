class TeachingSessionPolicy < ApplicationPolicy
  attr_reader :user, :teaching_session

  def initialize(user, teaching_session)
    @user = user
    @teaching_session = teaching_session
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
    user.is_staff?
  end

  def destroy?
    user.role == "admin"
  end

  def get_historical_stats?
    user.role == "admin"
  end

end