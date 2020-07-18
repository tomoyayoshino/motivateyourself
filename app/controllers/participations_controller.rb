class ParticipationsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    participation = current_user.participations.build(event_id: params[:event_id])
    participation.save
  end

  def destroy
    @event = Event.find(params[:event_id])
    participation = Participation.find_by(event_id: params[:event_id], user_id: current_user.id)
    participation.destroy
  end
end
