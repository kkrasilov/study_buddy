# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :surname, null: false, default: ''
      t.string :login, index: { unique: true }
      t.string :email, index: { unique: true }
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
