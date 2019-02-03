class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.belongs_to :topic, foreign_key: true
      t.belongs_to :report, foreign_key: true
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end
