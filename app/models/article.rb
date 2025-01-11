# frozen_string_literal: true

class Article < ApplicationRecord
  has_one_attached :image
  has_rich_text :content

  scope :sorted, -> { order(:id) }

  enum kind: {
    development: 'development',
    scientific_pop: 'scientific_pop'
  }

  enum level: {
    easy: 'easy',
    middle: 'middle',
    hard: 'hard'
  }

  def self.ransackable_attributes(_auth_object = nil)
    %w[kind]
  end
end
