# frozen_string_literal: true

class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope if @user.admin?

      @user.groups
    end
  end

  def new?
    @user.present?
  end

  def show?
    admin? || member?
  end

  def create?
    @user.present?
  end

  def edit?
    admin? || author?
  end

  def update?
    admin? || author?
  end

  def destroy?
    admin? || author?
  end

  private

  def member?
    @user&.groups&.include?(@record)
  end

  def admin?
    @user&.admin?
  end

  def author?
    @record.author == @user
  end
end
