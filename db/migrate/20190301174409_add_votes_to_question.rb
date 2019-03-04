class AddVotesToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :votes, :integer, default: 0
  end
end
