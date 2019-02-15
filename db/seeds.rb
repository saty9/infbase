# frozen_string_literal: true

users = [
  { first_name: 'Ivan1', last_name: 'Petar1', role: 'student', email: 'john1@gmail.com' },
  { first_name: 'Ivan2', last_name: 'Petar2', role: 'student', email: 'john2@gmail.com' },
  { first_name: 'Ivan3', last_name: 'Petar3', role: 'student', email: 'john3@gmail.com' },
  { first_name: 'Ivan4', last_name: 'Petar4', role: 'student', email: 'john4@gmail.com' },
  { first_name: 'Ivan5', last_name: 'Petar5', role: 'student', email: 'john5@gmail.com' },
  { first_name: 'Ivan6', last_name: 'Petar6', role: 'student', email: 'john6@gmail.com' },
  { first_name: 'Ivan7', last_name: 'Petar7', role: 'student', email: 'john7@gmail.com' },
  { first_name: 'Ivan8', last_name: 'Petar8', role: 'student', email: 'john8@gmail.com' },
  { first_name: 'Ivan9', last_name: 'Petar9', role: 'tutor', email: 'john9@gmail.com' },
  { first_name: 'Ivan0', last_name: 'Petar0', role: 'tutor', email: 'john0@gmail.com' },
  { first_name: 'Ivan11', last_name: 'Petar11', role: 'tutor', email: 'john11@gmail.com' },
  { first_name: 'Ivan12', last_name: 'Petar12', role: 'tutor', email: 'john12@gmail.com' },
  { first_name: 'Ivan13', last_name: 'Petar13', role: 'admin', email: 'john13@gmail.com' },
  { first_name: 'Ivan14', last_name: 'Petar14', role: 'admin', email: 'john14@gmail.com' }
]

password_params = { password: 'password', password_confirmation: 'password' }

courses = [
  { name: 'CogSci' },
  { name: 'Inf2B' },
  { name: 'Inf2D' },
  { name: 'DA' },
  { name: 'OP' }
]

hours = [
  { start: '10:00', end: '11:00' },
  { start: '11:00', end: '12:00' },
  { start: '12:10', end: '13:10' },
  { start: '13:10', end: '14:10' },
  { start: '14:10', end: '15:10' },
  { start: '15:10', end: '16:10' },
  { start: '16:10', end: '17:10' },
  { start: '17:10', end: '18:10' }
]

users.each do |user_params|
  User.create_with(password_params).find_or_create_by(user_params)
end

p 'Seeded users'

courses.each do |course_params|
  Course.find_or_create_by(course_params)
end

p 'Seeded courses.'

hours.each do |hour_params|
  Hour.find_or_create_by(hour_params)
end

p 'Seeded hours'
