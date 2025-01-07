# frozen_string_literal: true

class Group
  class Document < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :group

    has_one_attached :document
  end
end
