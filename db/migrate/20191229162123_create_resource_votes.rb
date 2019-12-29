class CreateResourceVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_votes do |t|
      t.belongs_to :useful_resource, foreign_key: {on_delete: :cascade}
      t.belongs_to :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end

    add_column :useful_resources, :votes, :integer, default: 0
  end
end
