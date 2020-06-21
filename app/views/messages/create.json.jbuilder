json.user_name @message.user.name
json.user_image @message.user.image
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content text_url_to_link(h(@message.content)).html_safe
json.image @message.image_url
