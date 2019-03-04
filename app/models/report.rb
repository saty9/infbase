# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id                  :bigint(8)        not null, primary key
#  students            :integer
#  comment             :text
#  completed           :boolean
#  teaching_session_id :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :teaching_session

  has_many :report_topics
  has_many :topics, through: :report_topics

  scope :of_tutor, lambda { |tutor_id|
    joins(:teaching_session)
      .where('teaching_sessions.tutor_id = ?', tutor_id)
  }

  scope :in_range, lambda { |start_date, end_date|
    where(completed: true)
      .joins(:teaching_session)
      .where('teaching_sessions.start_date > ? AND teaching_sessions.start_date < ?',
             start_date, end_date)
      .ordered_by_session_date
  }

  def self.past_reports
    joins(:teaching_session)
      .where('teaching_sessions.start_date <= ?', Time.now)
      .order('teaching_sessions.start_date DESC')
  end

  def self.to_csv(start_date, end_date)
    csv = []
    Report.in_range(start_date, end_date).each do |report|
      csv << {"date": "#{report.teaching_session.start_date} #{report.teaching_session.hour.start.strftime('%H:%M')}", 
              "tutor": report.teaching_session.tutor.full_name, 
              "students": report.students, 
              "topics": self.topics.pluck(:name), 
              "comments": report.comment}
    end
    csv
  end

  def self.ordered_by_session_date
    includes(:teaching_session).order('teaching_sessions.start_date DESC')
  end

  def merge_data
    hour = teaching_session.hour.start.strftime('%H:%M')
    date = teaching_session.start_date.strftime('%-d %b %y')
    tutor = teaching_session.tutor
    topics = self.topics.pluck(:name)

    as_json.merge(date: "#{hour} - #{date}",
                  tutor_name: "#{tutor.first_name} #{tutor.last_name}",
                  topics: topics)
  end
end
