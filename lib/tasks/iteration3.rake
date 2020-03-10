namespace :iteration3 do

task clear_useful_resources_and_schedule: [:environment] do
  TeachingSession.destroy_all
  UsefulResource.destroy_all
  Report.destroy_all
  Interest.destroy_all
  Hour.destroy_all
  Question.destroy_all
  Question.__elasticsearch__.refresh_index!
  Expertise.destroy_all
  User.destroy_all
  Course.destroy_all
end

desc "creates a test setup for you"
task setup: [:clear_useful_resources_and_schedule, :environment] do
  admin = User.create(email:"admin@admin.com", first_name:"test", last_name:"admin", role: :admin, password:"veryword")
  tutor = User.create(email:"tutor@tutor.com", first_name:"tutor1", last_name:"tutor", role: :tutor, password:"veryword")
  t2 = User.create(email:"tutor2@tutor.com", first_name:"tutor2", last_name:"tutor", role: :tutor, password:"veryword")
  student = User.create(email:"student@student.com", first_name:"test", last_name:"student", role: :student, password:"veryword")
  student = User.create(email:"a@b.com", first_name:"EASE", last_name:"student", role: :student, password:"veryword", remoteid: "s1511964")
  for x in 0..30 do
    User.create(email:(x.to_s() +"automated@me.com"), first_name:"fake", last_name:"student", role: :student, password:"veryword")
  end
  c = Course.create(name:"DMMR")
  Course.create(name: "Probability with applications")
  pf = Course.create(name: "PFNL")
  Expertise.create(course: c, tutor: tutor)
  Expertise.create(course: pf, tutor: t2)
  tutor.avatar.attach(io: File.open("lib/tasks/tutor_face.png"), filename: "tutor_face.jpg", content_type: "image/png")
  t2.avatar.attach(io: File.open("lib/tasks/tutor_face.png"), filename: "tutor_face.jpg", content_type: "image/png")
  monday = Date.today.beginning_of_week
  last_monday = monday - 7.days
  for x in 0..4 do
    start_time = last_monday + x.days + (10+x).hours
    h = Hour.create(start:Time.at(0) + (10+x).hours,end:Time.at(0) + (11 + x).hours)
    t = (x % 2) > 0 ? tutor: t2
    s1 = TeachingSession.create(start_date:start_time, tutor:t, hour:h)
    s2 = TeachingSession.create(start_date:start_time + 7.days, tutor:t, hour: h)
    s3 = TeachingSession.create(start_date:start_time + 14.days, tutor:t, hour: h)
    for session in [s1,s2,s3] do
      report_students = rand(3..11)
      interested_students = rand(3..12)
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
  Course.all.each {|c|
    for x in 0..10 do
      q = Question.create(title: "Can you make pot noodles in a kettle? " + x.to_s, body: "I know you are meant to use microwaves but I think there's a conspiracy and kettles work just as well", user: student, course: c, teaching_session: s1)
      if (10 == x or [true, false, true].sample) and x != 0
        q.answers.create(body: "no that's a terrible idea", user: tutor)
        q.update(resolved: true)
      end
      if (10 == x or [true, false, true].sample) and x != 0
        q.question_followups.create(body: "What does green paint taste like?")
      end
    end
  }
  c.useful_resources.create(body: "# Title\nnormal __Bold__ _italics_ ~~cross~~\n**bold** *italics*")
  c.useful_resources.create(body: "# Maths is hard")

end
end
