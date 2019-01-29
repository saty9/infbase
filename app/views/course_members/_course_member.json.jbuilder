json.extract! course_member, :id, :role, :user_id, :course_id, :created_at, :updated_at
json.url course_member_url(course_member, format: :json)
