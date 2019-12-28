class QuestionPolicy < ApplicationPolicy
  attr_reader :user, :question

  def initialize(user, question)
    @user = user
    @question = question
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
    user.is_staff? or question.user == @user
  end



  def destroy?
    user.is_staff?
  end



end