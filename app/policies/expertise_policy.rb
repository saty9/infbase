class ExpertisePolicy < ApplicationPolicy
  attr_reader :user, :expertise

  def initialize(user, expertise)
    @user = user
    @expertise = expertise
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.role == "admin" or expertise.tutor == user
  end

  def update?
    user.role == "admin" or expertise.tutor == user
  end

  def destroy?
    user.role == "admin" or expertise.user == user
  end

end