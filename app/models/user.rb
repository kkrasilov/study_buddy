# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :group_users, class_name: 'Group::User', dependent: :destroy
  has_many :groups, through: :group_users
  has_many :questions, class_name: 'Group::Question', foreign_key: :author_id
  has_many :messages, -> { sorted }, class_name: 'Group::Message', dependent: :destroy

  validates :email, uniqueness: true
  validates :email, presence: true

  has_one_attached :avatar

  enum gender: {
    male: 'male',
    female: 'female'
  }

  def short_name
    "#{surname} #{first_name}"
  end
end
