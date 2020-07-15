json.array! @posts do |post|
  json.id post.id
  json.content text_url_to_link(h(post.content)).html_safe
  json.image post.image.url
  json.created_at post.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.user_id post.user_id
  json.name post.user.name
  json.icon post.user.image.url
  json.user_sign_in current_user
end
