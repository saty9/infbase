# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id                  :bigint(8)        not null, primary key
#  students            :integer
#  comment             :text
#  tutor_id            :bigint(8)
#  teaching_session_id :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :teaching_session

  has_many :tags

  scope :of_tutor, lambda { |tutor_id|
    where(tutor_id: tutor_id)
  }

  def self.past_reports
    joins(:teaching_session)
    .where('teaching_sessions.start_date <= ?', Time.now)
    .order('teaching_sessions.start_date DESC')
  end

  def merge_data
    hour = teaching_session.hour.start.strftime('%H:%M')
    date = teaching_session.start_date.strftime('%-d %B %Y')
    tutor = teaching_session.tutor
    as_json.merge(date: "#{hour} - #{date}", 
                  tutor_name: "#{tutor.first_name} #{tutor.last_name}")
  end
end
