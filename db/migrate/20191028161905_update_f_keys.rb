class UpdateFKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :questions, :teaching_sessions
    add_foreign_key :questions, :teaching_sessions, on_delete: :nullify
    remove_foreign_key :answers, :questions
    add_foreign_key :answers, :questions, on_delete: :cascade
    remove_foreign_key :interests, :teaching_sessions
    add_foreign_key :interests, :teaching_sessions, on_delete: :cascade
    remove_foreign_key :reports, :teaching_sessions
    add_foreign_key :reports, :teaching_sessions, on_delete: :cascade
  end
end
