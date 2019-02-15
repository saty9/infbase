# frozen_string_literal: true

class AddTimeToTeachingSessions < ActiveRecord::Migration[5.2]
  def change
    add_reference :teaching_sessions, :hour, foreign_key: true
    add_column :teaching_sessions, :start_date, :date
  end
end
