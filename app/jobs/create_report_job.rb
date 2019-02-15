# frozen_string_literal: true

class CreateReportJob
  include SuckerPunch::Job

  def perform(sessions)
    sessions = [sessions]
    sessions.map do |ses|
      Report.create(teaching_session_id: ses.id,
                    tutor_id: ses.tutor_id,
                    completed: false)
    end
  end
end
