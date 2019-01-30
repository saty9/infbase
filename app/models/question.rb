class Question < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :session
  has_many :answers

end
