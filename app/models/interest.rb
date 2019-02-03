class Interest < ApplicationRecord
  belongs_to :teaching_session
  belongs_to :user
end
