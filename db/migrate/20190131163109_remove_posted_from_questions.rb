class RemovePostedFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :posted, :datetime
  end
end
