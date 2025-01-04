# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ''
      t.string :level, null: false, default: 'easy'
      t.integer :minutes_to_read, null: false, default: 0
      t.integer :visit_count, null: false, default: 0
      t.string :kind, null: false, default: 'development'

      t.timestamps
    end
  end
end
