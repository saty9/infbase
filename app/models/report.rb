# == Schema Information
#
# Table name: reports
#
#  id         :bigint(8)        not null, primary key
#  students   :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
  has_many :tags
end
