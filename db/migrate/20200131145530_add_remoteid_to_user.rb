class AddRemoteidToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remoteid, :string
  end
end
