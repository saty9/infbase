class TopicPolicy < ApplicationPolicy
  attr_reader :user, :topic

  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def index?
    true
  end

  def show?
    true
  end

  def stats?
    user.role == "admin"
  end

  def create?
    true
  end

  def update?
    user.is_staff?
  end

  def destroy?
    user.is_staff?
  end

end