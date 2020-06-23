class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      respond_to do |format|
        format.json
      end
      @message.user_id = current_user.id
      @message_room = @message.room
      @message_room.create_notification_message!(current_user, @message.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :room_id, :image).merge(user_id: current_user.id)
  end
end
