# frozen_string_literal: true

class AddBiographyToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :biography, :string
  end
end
