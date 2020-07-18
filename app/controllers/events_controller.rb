class EventsController < ApplicationController
  before_action :move_to_index

  def index
    @events = Event.includes(:user).order("created_at DESC").limit(255)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  # def destroy
  #   post = Post.find(params[:id])
  #   post.destroy
  #   redirect_to root_path
  # end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   post = Post.find(params[:id])
  #   post.update(post_params)
  #   redirect_to root_path
  # end

  # def show
  #   @post = Post.find(params[:id])
  #   @comment = Comment.new
  #   @comments = @post.comments.includes(:user)
  # end

  # def search
  #   @posts = Post.search(params[:keyword]).order("created_at DESC").limit(255)
  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end

  private

  def event_params
    params.require(:event).permit(:title, :description, :place, :day, :start, :end).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
