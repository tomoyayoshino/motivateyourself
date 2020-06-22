class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    user = User.find(params[:user_id])
    follow.save
    redirect_to user_path(user)
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    user = User.find(params[:user_id])
    follow.destroy
    redirect_to user_path(user)
  end
end
