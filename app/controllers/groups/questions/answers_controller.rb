# frozen_string_literal: true

module Groups
  module Questions
    class AnswersController < ApplicationController
      # before_action :set_group, only: %i[index show]

      def create
        @answer = Group::Question::Answer.new(create_params)

        authorize @answer

        if @answer.save
          flash[:notice] = I18n.t('notice.add_answer')
        else
          flash[:error] = @answer.errors.full_messages
        end

        redirect_to group_question_path(group_id: @answer.question.group_id, id: @answer.question.id)
      end

      private

      def create_params
        params.require(:group_question_answer).permit(:title, :body).merge(question_id: params[:question_id],
                                                                           author_id: current_user.id)
      end
    end
  end
end
