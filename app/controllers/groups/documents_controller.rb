# frozen_string_literal: true

module Groups
  class DocumentsController < ApplicationController
    def create
      @document = Group::Document.new(create_params)

      authorize @document

      if @document.save
        flash[:notice] = I18n.t('notice.updated')
        redirect_to group_path(@document.group)
      else
        flash[:error] = @document.errors.full_messages
        redirect_to group_path(@document.group)
      end
    end

    def destroy
      @document = Group::Document.find(params[:id])

      authorize @document

      flash[:notice] = I18n.t('notice.delete_document')
      @document.destroy
      redirect_to group_path(@document.group)
    end

    private

    def create_params
      params.require(:group_document).permit(:file).merge(group_id: params[:group_id], author_id: current_user.id)
    end
  end
end
