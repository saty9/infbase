class RemovePostedFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :posted, :datetime
  end
end
