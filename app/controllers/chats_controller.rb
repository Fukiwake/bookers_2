class ChatsController < ApplicationController

  def create
    @chat = Chat.create(chat_params)
    @room = @chat.room
    if @chat.save
      @chat = Chat.new
      gets_entries_all_messages
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :user_id, :room_id).merge(user_id: current_user.id)
  end

  def gets_entries_all_messages
    @chats = @room.chats.includes(:user).order("created_at asc")
    @entries = @room.entries
  end

end
