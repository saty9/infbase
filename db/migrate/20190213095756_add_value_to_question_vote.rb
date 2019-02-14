class AddValueToQuestionVote < ActiveRecord::Migration[5.2]
  def change
    add_column :question_votes, :value, :integer
    change_column_default :question_votes, :value, 1
  end
end
