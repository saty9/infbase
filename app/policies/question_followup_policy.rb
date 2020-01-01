class QuestionFollowupPolicy < ApplicationPolicy
  attr_reader :user, :question_followup

  def initialize(user, question_followup)
    @user = user
    @question_followup = question_followup
  end

  def index?
    true
  end

  def show?
    true
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