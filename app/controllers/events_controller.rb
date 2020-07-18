class EventsController < ApplicationController
  before_action :move_to_index
  before_action :set_event, only: [:edit, :show]

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

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  def edit
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to events_path
  end

  def show
  end

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

  def set_event
    @event = Event.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
