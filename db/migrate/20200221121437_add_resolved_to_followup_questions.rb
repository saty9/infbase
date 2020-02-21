class AddResolvedToFollowupQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :question_followups, :resolved, :boolean, null: false, default: false
  end
end
