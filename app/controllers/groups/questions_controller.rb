# frozen_string_literal: true

module Groups
  class QuestionsController < ApplicationController
    before_action :set_group, only: %i[index show]

    def index; end

    def show
      @question = Group::Question.find_by(id: params[:id])

      redirect_to root_path, notice: I18n.t('notice.not_found') if @question.blank?
    end

    def create
      @question = Group::Question.new(create_params)

      authorize @question

      if @question.save
        flash[:notice] = I18n.t('notice.add_question')
      else
        flash[:error] = @question.errors.full_messages
      end

      redirect_to group_path(@question.group)
    end

    private

    def create_params
      params.require(:group_question).permit(:title, :body).merge(group_id: params[:group_id],
                                                                  author_id: current_user.id)
    end

    def set_group
      @group = Group.find(params[:group_id])
    end
  end
end
