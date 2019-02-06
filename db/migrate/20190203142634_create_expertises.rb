# frozen_string_literal: true

class CreateExpertises < ActiveRecord::Migration[5.2]
  def change
    create_table :expertises do |t|
      t.belongs_to :course, foreign_key: true
      t.belongs_to :tutor, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
