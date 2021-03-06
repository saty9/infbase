# frozen_string_literal: true

class CreateQuestionVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :question_votes do |t|
      t.belongs_to :question, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
