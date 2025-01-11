# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def new?
    @user&.admin?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end
end
