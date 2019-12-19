class AddRestrictedToUsefulResources < ActiveRecord::Migration[5.2]
  def change
    add_column :useful_resources, :restricted, :boolean, default: false, null: false
  end
end
