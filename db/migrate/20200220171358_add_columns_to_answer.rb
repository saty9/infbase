class AddColumnsToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :user_role, :integer, null: false, default: 0
    remove_foreign_key :answers, :users
    add_foreign_key :answers, :users, on_delete: :nullify
  end
end
