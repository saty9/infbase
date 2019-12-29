class ResourceVote < ApplicationRecord
  after_commit :update_resource
  belongs_to :useful_resource
  belongs_to :user

  def update_resource
    if @_new_record_before_last_commit
      #creating
      resource.increment!(:votes,1)
    elsif @destroyed
      #destroying
      resource.decrement!(:votes,1)
    end
  end

end
