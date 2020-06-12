class UsersController < ApplicationController
  def show
    @name = current_user.name
    @posts = current_user.posts.order("created_at DESC")
  end
end
