# frozen_string_literal: true

class RemoveCourseFromTopics < ActiveRecord::Migration[5.2]
  def change
    remove_reference :topics, :course, foreign_key: true
  end
end
