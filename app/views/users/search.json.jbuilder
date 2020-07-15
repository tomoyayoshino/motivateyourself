json.array! @users do |user|
  json.id user.id
  json.profile text_url_to_link(h(user.profile)).html_safe
  json.image user.image.url
  json.name user.name
  json.user_sign_in current_user
end
