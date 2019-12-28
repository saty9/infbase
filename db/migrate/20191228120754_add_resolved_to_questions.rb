class AddResolvedToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :resolved, :boolean, :default => false
  end
end
