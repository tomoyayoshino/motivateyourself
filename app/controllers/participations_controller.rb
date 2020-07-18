class ParticipationsController < ApplicationController
  def create
    participation = current_user.participations.build(event_id: params[:event_id])
    participation.save
    event = Event.find(params[:event_id])
    redirect_to event_path(event.id)
  end

  def destroy
    participation = Participation.find_by(event_id: params[:event_id], user_id: current_user.id)
    participation.destroy
    event = Event.find(params[:event_id])
    redirect_to event_path(event.id)
  end
end
