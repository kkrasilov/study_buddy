# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  validates :login, uniqueness: true
  validates :email, uniqueness: true
  validates :login, presence: true
  validates :email, presence: true

  has_one_attached :avatar

  def short_name
    "#{surname} #{first_name}"
  end
end
