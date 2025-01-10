# frozen_string_literal: true

class Group
  class Question
    class AnswerPolicy < ApplicationPolicy
      def create?
        member?
      end

      private

      def member?
        @user.groups.include?(@record.question.group)
      end
    end
  end
end
