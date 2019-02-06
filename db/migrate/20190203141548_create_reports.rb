class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :students
      t.text :comment

      t.belongs_to :tutor, foreign_key: {to_table: :users}
      t.belongs_to :teaching_session, foreign_key: true

      t.timestamps
    end
  end
end
