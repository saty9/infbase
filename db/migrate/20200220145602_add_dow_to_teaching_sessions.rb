class AddDowToTeachingSessions < ActiveRecord::Migration[5.2]

  def up
    add_column :teaching_sessions, :dow, :int
    TeachingSession.find_each do |s|
      s.dow = s.start_date.wday
      s.save!
    end
  end

  def down
    remove_column :teaching_sessions, :dow
  end
end
