# frozen_string_literal: true

class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :country, :string, null: false, default: ''
    add_column :users, :city, :string, null: false, default: ''
    add_column :users, :institution, :string, null: false, default: ''
    add_column :users, :profession, :string, null: false, default: ''
  end
end
