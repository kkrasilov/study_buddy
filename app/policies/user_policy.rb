# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    @user.present?
  end

  def edit?
    @user == @record
  end

  def update?
    edit?
  end
end
