# frozen_string_literal: true

class Group
  class Message < ApplicationRecord
    belongs_to :user, class_name: '::User'
    belongs_to :group

    scope :sorted, -> { order(:id) }

    validates :body, presence: true
  end
end
