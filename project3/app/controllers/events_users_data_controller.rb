# frozen_string_literal: true

class EventsUsersDataController < ApplicationController

  def update
    @event_user_datum = EventUserDatum.find(params[:id])
    @event_user_datum.update(event_user_datum_params)
    redirect_to user_events_path(current_user.id)
  end

  private

  def event_user_datum_params
    params.require(:event_user_datum).permit(:attending, :relation, :diet, :additional_persons, :num_babies, :num_toddlers, :require_carpark, :message)
  end
end
