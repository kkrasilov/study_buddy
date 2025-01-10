# frozen_string_literal: true

class CreateGroupQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :group_questions do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.belongs_to :group, null: false, foreign_key: true
      t.string :title, null: false, default: ''

      t.timestamps
    end
  end
end
