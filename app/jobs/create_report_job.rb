# frozen_string_literal: true

class CreateReportJob
  include SuckerPunch::Job

  def perform(session)
    Report.create(teaching_session_id: session.id,
                  tutor_id: session.tutor_id,
                  completed: false)
  end
end
