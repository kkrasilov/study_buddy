# frozen_string_literal: true

module Groups
  class MessagesController < ApplicationController
    def create
      @message = Group::Message.new(create_params)

      if @message.save
        group = @message.group

        @message.broadcast_append_to @message.group,
                                     target: "group_#{group.id}_messages",
                                     partial: 'groups/messages/message_other_user',
                                     locals: { message: @message }

        @message.broadcast_replace_to [current_user, group],
                                      target: "message-#{@message.id}",
                                      partial: 'groups/messages/message_current_user',
                                      locals: { message: @message }
      end
    end

    private

    def create_params
      params.require(:group_message).permit(:body, :group_id).merge(user_id: current_user.id)
    end
  end
end
