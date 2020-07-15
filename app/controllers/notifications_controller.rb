class NotificationsController < ApplicationController
  def index
    # current_userの投稿に紐づいた通知
    @notifications = current_user.passive_notifications.limit(100)
    # @notificationの中でまだ確認していない通知
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
