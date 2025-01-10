# frozen_string_literal: true

class Group
  class Question
    class Answer < ApplicationRecord
      belongs_to :author, class_name: '::User'
      belongs_to :question, class_name: 'Group::Question'

      has_rich_text :body
    end
  end
end
