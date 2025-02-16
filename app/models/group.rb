# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :author, class_name: '::User'
  has_many :group_users, class_name: 'Group::User', dependent: :destroy
  has_many :users, through: :group_users
  has_many :documents, class_name: 'Group::Document', dependent: :destroy
  has_many :questions, class_name: 'Group::Question', dependent: :destroy
  has_many :messages, -> { sorted }, class_name: 'Group::Message', dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  before_save :set_token
  after_commit :add_author_to_users, on: :create

  has_one_attached :image

  def self.ransackable_attributes(_auth_object = nil)
    %w[name]
  end

  private

  def set_token
    self.token = JWT.encode(name, ENV.fetch('JWT_SECRET', nil))
  end

  def add_author_to_users
    Group::User.create(user_id: author_id, group_id: id)
  end
end
