class UsefulResourceAttachmentPolicy < ApplicationPolicy
  attr_reader :user, :useful_resource_attachment

  def initialize(user, useful_resource_attachment)
    @user = user
    @useful_resource = useful_resource_attachment
  end

  def index?
    false
  end

  def show?
    if user.is_staff?
      true
    else
      not useful_resource_attachment.useful_resource.restricted
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