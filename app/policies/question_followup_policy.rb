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
    user.is_staff? or
        (question_followup.user == user and not QuestionFollowup.where(parent:@question_followup).exists?)
  end



  def destroy?
    user.is_staff? or
        (question_followup.user == user and not QuestionFollowup.where(parent:@question_followup).exists?)
  end



end