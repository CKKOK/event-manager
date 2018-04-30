# frozen_string_literal: true

class EventsUsersDataController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def update
    event_user_datum = EventUserDatum.find(params[:id])
    event_user_datum.update(event_user_datum_params)
    redirect_to root_path
  end

  def mark_attendance
    event_user_datum = EventUserDatum.find(params[:id])
    event_user_datum.update(event_user_datum_attendance_params)
    head :ok, :content_type => 'text/html'
  end

  private

  def event_user_datum_params
    params.require(:event_user_datum).permit(:attending, :relation, :diet, :additional_persons, :num_babies, :num_toddlers, :require_carpark, :message, :attended)
  end

  def event_user_datum_attendance_params
    params.require(:event_user_datum).permit(:attended)
  end
end
