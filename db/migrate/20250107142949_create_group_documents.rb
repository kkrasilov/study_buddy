# frozen_string_literal: true

class CreateGroupDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :group_documents do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
