# frozen_string_literal: true

class Group
  class QuestionPolicy < ApplicationPolicy
    def create?
      member?
    end

    private

    def member?
      @user.groups.include?(@record.group)
    end
  end
end
