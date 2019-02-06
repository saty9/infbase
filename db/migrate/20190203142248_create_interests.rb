# frozen_string_literal: true

class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.belongs_to :teaching_session, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
