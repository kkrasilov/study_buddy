# frozen_string_literal: true

class Group
  class Question < ApplicationRecord
    belongs_to :author, class_name: '::User'
    belongs_to :group
    has_many :answers, class_name: 'Group::Question::Answer', dependent: :destroy

    validates :title, presence: true

    has_rich_text :body
  end
end
