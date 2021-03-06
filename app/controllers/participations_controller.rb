class ParticipationsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]

  def create
    participation = current_user.participations.build(event_id: params[:event_id])
    participation.save
    redirect_to event_path(@event.id)
  end

  def destroy
    participation = Participation.find_by(event_id: params[:event_id], user_id: current_user.id)
    participation.destroy
    redirect_to event_path(@event.id)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
