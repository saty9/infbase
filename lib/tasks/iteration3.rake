namespace :iteration3 do

task clear_useful_resources_and_schedule: [:environment] do
  TeachingSession.delete_all
  UsefulResource.delete_all
  Report.delete_all
  Interest.delete_all
  Hour.delete_all
  Question.delete_all
  Question.__elasticsearch__.refresh_index!
  Expertise.delete_all
  User.delete_all
  Course.delete_all
end

desc "creates a test setup for you"
task setup: [:clear_useful_resources_and_schedule, :environment] do
  admin = User.create(email:"admin@admin.com", first_name:"test", last_name:"admin", role: :admin, password:"veryword")
  tutor = User.create(email:"tutor@tutor.com", first_name:"test", last_name:"tutor", role: :tutor, password:"veryword")
  student = User.create(email:"student@student.com", first_name:"test", last_name:"student", role: :student, password:"veryword")
  student = User.create(email:"a@b.com", first_name:"EASE", last_name:"student", role: :student, password:"veryword", remoteid: "s1511964")
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
      report_students = rand(1..11)
      interested_students = rand(0..12)
      if x == 4
        report_students = 10
        interested_students = 5
      elsif x==3
        report_students = 1
        interested_students = 10
      end
      if session.start_date.past?
        session.report.update(students: report_students)
      end
      users = User.where(first_name:"fake", last_name:"student").all[0..interested_students]
      users.each { |u| Interest.create(user:u,teaching_session:session) }
      session.save()
    end
  end
  for x in 0..10 do
    q = Question.create(title: "Can you make pot noodles in a kettle? " + x.to_s, body: "I know you are meant to use microwaves but I think there's a conspiracy and kettles work just as well", user: student, course: c, teaching_session:s1 )
    q.question_followups.create(body: "What does green paint taste like?")
    if (10 == x or [true, false, true].sample) and x != 0
      q.answers.create(body: "no that's a terrible idea", user: tutor)
      q.update(resolved: true)
    end
  end
  c.useful_resources.create(body: "# Title\nnormal __Bold__ _italics_ ~~cross~~\n**bold** *italics*")
  c.useful_resources.create(body: "# Maths is hard")

end
end
