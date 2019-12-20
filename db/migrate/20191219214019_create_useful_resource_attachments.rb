class CreateUsefulResourceAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :useful_resource_attachments do |t|
      t.belongs_to :useful_resource, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
