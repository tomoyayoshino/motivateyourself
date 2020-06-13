class UsersController < ApplicationController

  def edit
    user = User.find(params[:id])
    @image = user.image
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @posts = @user.posts.order("created_at DESC")
    @image = @user.image
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
