# frozen_string_literal: true

class AddDescriptionToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :description, :text, null: false, default: ''
  end
end
