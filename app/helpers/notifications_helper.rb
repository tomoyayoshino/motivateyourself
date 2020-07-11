module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    your_post = link_to 'あなたの投稿', user_path(notification), style: "font-weight: bold;"
    case notification.action
    when "follow"
      tag.a(notification.visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "さんがあなたをフォローしました"
    when "favorite"
      tag.a(notification.visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "さんが" + tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;") + "にいいねしました"
    when "comment"
      tag.a(@visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "さんが" + tag.a('投稿', href: post_path(notification.post_id), style: "font-weight: bold;") + "にコメントしました"
    when "message"
      tag.a(@visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "さんが" + tag.a('DM', href: room_path(notification.room_id), style: "font-weight: bold;") + "にメッセージを投稿しました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
