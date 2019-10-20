class CreateUsefulResources < ActiveRecord::Migration[5.2]
  def change
    create_table :useful_resources do |t|
      t.text :body
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
