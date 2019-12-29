class ResourceVote < ApplicationRecord
  after_commit :update_resource
  belongs_to :useful_resource
  belongs_to :user

  def update_resource
    if @_new_record_before_last_commit
      #creating
      useful_resource.increment!(:votes,1)
    elsif @destroyed
      #destroying
      useful_resource.decrement!(:votes,1)
    end
  end

end
