# frozen_string_literal: true

class GroupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @user.groups
    end
  end

  def new?
    @user.present?
  end

  def show?
    return false unless @user.present?

    member?
  end

  def create?
    @user.present?
  end

  def edit?
    @user.present?
  end

  def update?
    @user.present?
  end

  def destroy?
    @user.present?
  end

  private

  def member?
    @user.groups.include?(@record)
  end
end
