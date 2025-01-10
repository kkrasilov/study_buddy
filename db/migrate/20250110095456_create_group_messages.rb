# frozen_string_literal: true

class CreateGroupMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :group_messages do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true
      t.string :body, null: false

      t.timestamps
    end
  end
end
