# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :token

      t.timestamps
    end
  end
end
