class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.time :start_time

      t.timestamps
    end
  end
end
