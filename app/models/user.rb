# frozen_string_literal: true

class User < ApplicationRecord
  validates :login, uniqueness: true
  validates :email, uniqueness: true
  validates :login, presence: true
  validates :email, presence: true

  def short_name
    "#{surname} #{first_name}"
  end
end
