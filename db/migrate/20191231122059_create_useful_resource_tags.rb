class CreateUsefulResourceTags < ActiveRecord::Migration[5.2]
  def change
    create_table :useful_resource_tags do |t|
      t.belongs_to :useful_resource, foreign_key: {on_delete: :cascade}
      t.belongs_to :topic, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
