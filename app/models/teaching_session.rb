# frozen_string_literal: true

# == Schema Information
#
# Table name: teaching_sessions
#
#  id         :bigint(8)        not null, primary key
#  tutor_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hour_id    :bigint(8)
#  start_date :date
#

class TeachingSession < ApplicationRecord
  belongs_to :tutor, class_name: 'User'
  belongs_to :hour

  has_many :questions
  has_many :interests, dependent: :delete_all
  has_one :report, dependent: :destroy

  scope :in_range, lambda { |start, finish|
    where(['start_date >= ? and start_date < ?', start.to_date, finish.to_date])
  }

  def self.create_weekly(params:, until_date:)
    period_start = (Date.parse(params[:start_date]) + 7.day).to_datetime
    period_end   = Date.parse(until_date).to_datetime

    tutor_id = params[:tutor_id]
    hour_id = params[:hour_id]

    teaching_sessions = []

    (period_start.to_i..period_end.to_i).step(7.day) do |day|
      day = Time.zone.at(day).to_date
      teaching_sessions << { tutor_id: tutor_id, hour_id: hour_id, start_date: day }
    end
    TeachingSession.create(teaching_sessions)
  end

  def to_json
    { id: id, hour_id: hour.id, start_date: start_date.strftime('%Y.%-m.%e'),
      tutor_f_name: tutor.first_name, tutor_id: tutor_id }
  end
end
