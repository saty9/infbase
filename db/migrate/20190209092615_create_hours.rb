# frozen_string_literal: true

class CreateHours < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
