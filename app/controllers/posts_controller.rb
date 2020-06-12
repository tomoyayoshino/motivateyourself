class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @posts = Post.all.order("created_at DESC")
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
