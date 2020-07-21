class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new_guest
  before_action :set_user, only: [:edit, :show, :follows, :followers]

  def index
    @users = User.all
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @posts = @user.posts.order("created_at DESC")
    @favorite_posts = @user.favorite_posts.order("created_at DESC")
    # DM機能
    # ログインしてるユーザー
    @currentUserEntry = Entry.where(user_id: current_user.id)
    # DMしたい相手のユーザー
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      # ログインしてるユーザーのエントリーしている部屋の中から、相手のユーザーもいる部屋を探す
      # 一致する部屋がある場合、その部屋を表示させる
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      # DMをするroomがない(初めての場合)
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
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

  def set_user
    @user = User.find(params[:id])
  end
end
