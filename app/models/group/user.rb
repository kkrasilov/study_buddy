# frozen_string_literal: true

class Group
  class User < ApplicationRecord
    belongs_to :group
    belongs_to :user
  end
end
