class CreateQuestionFollowups < ActiveRecord::Migration[5.2]
  def change
    create_table :question_followups do |t|
      t.belongs_to :question , foreign_key: {on_delete: :cascade}
      t.belongs_to :question_followup, null:true, foreign_key: {on_delete: :cascade, name: :parent}
      t.string :body

      t.timestamps
    end
  end
end
