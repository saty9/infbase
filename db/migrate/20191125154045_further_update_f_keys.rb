class FurtherUpdateFKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :course_members, :courses
    add_foreign_key :course_members, :courses, on_delete: :cascade
    remove_foreign_key :questions, :courses
    add_foreign_key :questions, :courses, on_delete: :cascade
    remove_foreign_key :expertises, :courses
    add_foreign_key :expertises, :courses, on_delete: :cascade
    remove_foreign_key :question_tags, :questions
    add_foreign_key :question_tags, :questions, on_delete: :cascade
    remove_foreign_key :question_votes, :questions
    add_foreign_key :question_votes, :questions, on_delete: :cascade
  end
end
