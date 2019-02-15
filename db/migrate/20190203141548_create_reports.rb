# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :students
      t.text :comment
      t.boolean :completed

      t.belongs_to :teaching_session, foreign_key: true

      t.timestamps
    end
  end
end
