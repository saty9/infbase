# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_27_093345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "course_members", force: :cascade do |t|
    t.integer "role"
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_members_on_course_id"
    t.index ["user_id"], name: "index_course_members_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expertises", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_expertises_on_course_id"
    t.index ["tutor_id"], name: "index_expertises_on_tutor_id"
  end

  create_table "hours", force: :cascade do |t|
    t.time "start"
    t.time "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "teaching_session_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teaching_session_id"], name: "index_interests_on_teaching_session_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "question_followups", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "question_followup_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_followup_id"], name: "index_question_followups_on_question_followup_id"
    t.index ["question_id"], name: "index_question_followups_on_question_id"
  end

  create_table "question_tags", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_tags_on_question_id"
    t.index ["topic_id"], name: "index_question_tags_on_topic_id"
  end

  create_table "question_votes", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value", default: 1
    t.index ["question_id"], name: "index_question_votes_on_question_id"
    t.index ["user_id"], name: "index_question_votes_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "anonymous"
    t.bigint "user_id"
    t.bigint "course_id"
    t.bigint "teaching_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views", default: 0
    t.integer "votes", default: 0
    t.index ["course_id"], name: "index_questions_on_course_id"
    t.index ["teaching_session_id"], name: "index_questions_on_teaching_session_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "report_topics", force: :cascade do |t|
    t.bigint "report_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_topics_on_report_id"
    t.index ["topic_id"], name: "index_report_topics_on_topic_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "students"
    t.text "comment"
    t.boolean "completed"
    t.bigint "teaching_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teaching_session_id"], name: "index_reports_on_teaching_session_id"
  end

  create_table "teaching_sessions", force: :cascade do |t|
    t.bigint "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hour_id"
    t.date "start_date"
    t.index ["hour_id"], name: "index_teaching_sessions_on_hour_id"
    t.index ["tutor_id"], name: "index_teaching_sessions_on_tutor_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "useful_resource_attachments", force: :cascade do |t|
    t.bigint "useful_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["useful_resource_id"], name: "index_useful_resource_attachments_on_useful_resource_id"
  end

  create_table "useful_resources", force: :cascade do |t|
    t.text "body"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "restricted", default: false, null: false
    t.index ["course_id"], name: "index_useful_resources_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "biography"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions", on_delete: :cascade
  add_foreign_key "answers", "users"
  add_foreign_key "course_members", "courses", on_delete: :cascade
  add_foreign_key "course_members", "users"
  add_foreign_key "expertises", "courses", on_delete: :cascade
  add_foreign_key "expertises", "users", column: "tutor_id"
  add_foreign_key "interests", "teaching_sessions", on_delete: :cascade
  add_foreign_key "interests", "users"
  add_foreign_key "question_followups", "question_followups", name: "parent", on_delete: :cascade
  add_foreign_key "question_followups", "questions", on_delete: :cascade
  add_foreign_key "question_tags", "questions", on_delete: :cascade
  add_foreign_key "question_tags", "topics"
  add_foreign_key "question_votes", "questions", on_delete: :cascade
  add_foreign_key "question_votes", "users"
  add_foreign_key "questions", "courses", on_delete: :cascade
  add_foreign_key "questions", "teaching_sessions", on_delete: :nullify
  add_foreign_key "questions", "users"
  add_foreign_key "report_topics", "reports"
  add_foreign_key "report_topics", "topics"
  add_foreign_key "reports", "teaching_sessions", on_delete: :cascade
  add_foreign_key "teaching_sessions", "hours"
  add_foreign_key "teaching_sessions", "users", column: "tutor_id"
  add_foreign_key "useful_resource_attachments", "useful_resources", on_delete: :cascade
  add_foreign_key "useful_resources", "courses"
end
