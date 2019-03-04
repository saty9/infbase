# frozen_string_literal: true

class CreateReportTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :report_topics do |t|
      t.belongs_to :report, foreign_key: true
      t.belongs_to :topic, foreign_key: true

      t.timestamps
    end
  end
end
