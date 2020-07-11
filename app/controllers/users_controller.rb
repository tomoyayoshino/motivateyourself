class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new_guest

  def index
    @users = User.all
  end

  def edit
    user = User.find(params[:id])
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
    @posts = @user.posts.order("created_at DESC")
    @favorite_posts = @user.favorite_posts.order("created_at DESC")
    # DM機能
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def search
    @users = User.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
