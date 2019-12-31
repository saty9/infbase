class UsefulResourceTag < ApplicationRecord
  belongs_to :useful_resource
  belongs_to :topic
end
