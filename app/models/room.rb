class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :notifications, dependent: :destroy

  def create_notification_message!(current_user, message_id)
    temp_ids = Message.select(:user_id).where(room_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_message!(current_user, message_id, temp_id['user_id'])
    end
  end

  def save_notification_message!(current_user, message_id, visited_id)
    notification = current_user.active_notifications.new(
      room_id: id,
      message_id: message_id,
      visited_id: visited_id,
      action: 'message'
    )

    notification.checked = true if notification.visiter_id == notification.visited_id
    notification.save if notification.valid?
  end
end
