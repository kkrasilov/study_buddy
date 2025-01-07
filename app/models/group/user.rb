# frozen_string_literal: true

class Group
  class User < ApplicationRecord
    belongs_to :group
    belongs_to :user, class_name: '::User'
  end
end
