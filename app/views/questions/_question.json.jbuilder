json.extract! question, :id, :title, :body, :posted, :anonymous, :user_id, :course_id, :session_id, :created_at, :updated_at
json.url question_url(question, format: :json)
