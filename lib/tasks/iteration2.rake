namespace :iteration2 do

task clear_useful_resources_and_schedule: [:environment] do
  TeachingSession.delete_all
  UsefulResource.delete_all
  Report.delete_all
  Interest.delete_all
  Hour.delete_all
  Question.delete_all
  Expertise.delete_all
  User.delete_all
  Course.delete_all
end

desc "creates a test setup for you"
task setup: [:clear_useful_resources_and_schedule, :environment] do
  tutor = User.create(email:"tutor@tutor.com", first_name:"test", last_name:"tutor", role: :tutor, password:"veryword")
  student = User.create(email:"student@student.com", first_name:"test", last_name:"student", role: :student, password:"veryword")
  for x in 0..30 do
    User.create(email:(x.to_s() +"automated@me.com"), first_name:"fake", last_name:"student", role: :student, password:"veryword")
  end
  c = Course.create(name:"DMMR")
  Course.create(name: "Probability with applications")
  Course.create(name: "PFNL")
  Expertise.create(course: c, tutor: tutor)
  tutor.avatar.attach(io: File.open("lib/tasks/tutor_face.png"), filename: "tutor_face.jpg", content_type: "image/png")
  monday = Date.today.beginning_of_week
  last_monday = monday - 7.days
  for x in 0..4 do
    start_time = last_monday + x.days + (10+x).hours
    h = Hour.create(start:Time.at(0) + (10+x).hours,end:Time.at(0) + (11 + x).hours)

    s1 = TeachingSession.create(start_date:start_time, tutor:tutor, hour:h)
    s2 = TeachingSession.create(start_date:start_time + 7.days, tutor:tutor, hour: h)
    s3 = TeachingSession.create(start_date:start_time + 14.days, tutor:tutor, hour: h)
    for session in [s1,s2,s3] do
      if session.start_date.past?
        session.report.update(students: rand(3..13))
      end
      users = User.where(first_name:"fake", last_name:"student").all[0..rand(30)]
      users.each { |u| Interest.create(user:u,teaching_session:session) }
      session.save()
    end
  end
  for x in 0..10 do
    q = Question.create(title: "Question title " + x.to_s, body: "Question Body", user: student, course: c, teaching_session:s1 )
    q.question_followups.create(body: "Is this a useful followup question")
    q.answers.create(body: "This is an answer")
  end
  c.useful_resources.create(body: "# Title\nnormal __Bold__ _italics_ ~~cross~~\n**bold** *italics*")
end
end
