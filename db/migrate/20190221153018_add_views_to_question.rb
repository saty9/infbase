class AddViewsToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :views, :int, default: 0
  end
end
