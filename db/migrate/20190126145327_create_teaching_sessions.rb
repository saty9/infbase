# frozen_string_literal: true

class CreateTeachingSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :teaching_sessions do |t|
      t.time :start_time
      t.belongs_to :tutor, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
