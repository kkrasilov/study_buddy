# frozen_string_literal: true

class Group
  class DocumentPolicy < ApplicationPolicy
    def create?
      member?
    end

    def destroy?
      @record.author == @user || @record.group.author == @user
    end

    private

    def member?
      @user.groups.include?(@record.group)
    end
  end
end
