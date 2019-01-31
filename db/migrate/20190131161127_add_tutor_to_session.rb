class AddTutorToSession < ActiveRecord::Migration[5.2]
  def change
    add_reference :sessions, :tutor, foreign_key: {to_table: :users}
  end
end
