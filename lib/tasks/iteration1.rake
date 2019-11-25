namespace :iteration1 do

task clear_useful_resources_and_schedule: [:environment] do
  TeachingSession.delete_all
  UsefulResource.delete_all
  Report.delete_all
  Interest.delete_all
  Hour.delete_all
  User.where(email:"tutor@tutor.com").delete_all
  User.where(first_name:"fake", last_name: "student").delete_all
  Course.where(name:"DMMR").delete_all
end

desc "creates a test setup for you"
task setup: [:clear_useful_resources_and_schedule, :environment] do
  u = User.create(email:"tutor@tutor.com", first_name:"test", last_name:"tutor", role: :tutor, password:"veryword")
  for x in 0..30 do
    User.create(email:(x.to_s() +"automated@me.com"), first_name:"fake", last_name:"student", role: :student, password:"veryword")
  end
  c = Course.create(name:"DMMR")
  monday = Date.today.beginning_of_week
  last_monday = monday - 7.days
  for x in 0..4 do
    start_time = last_monday + x.days + (10+x).hours
    h = Hour.create(start:Time.at(0) + (10+x).hours,end:Time.at(0) + (11 + x).hours)

    s1 = TeachingSession.create(start_date:start_time, tutor:u, hour:h)
    s2 = TeachingSession.create(start_date:start_time + 7.days, tutor:u, hour: h)
    s3 = TeachingSession.create(start_date:start_time + 14.days, tutor:u, hour: h)
    for session in [s1,s2,s3] do
      if session.start_date.past?
        session.report.update(students: rand(3..13))
      end
      users = User.where(first_name:"fake", last_name:"student").all[0..rand(30)]
      users.each { |u| Interest.create(user:u,teaching_session:session) }
      session.save()
    end
  end
  c.useful_resources.create(body: "# did you know maths is hard")
end
end
