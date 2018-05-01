# frozen_string_literal: true

class EventsController < ApplicationController
    
    before_action :authenticate_user!#, :except => [ :show, :index ]

    def index
        if params[:user_id]
            @user = User.find(current_user.id)
            #listing of user created events
            @events = Event.find_by_sql("SELECT events.id, datetime, title from events INNER JOIN rsvps ON events.id = rsvps.event_id INNER JOIN event_user_data ON rsvps.id = event_user_data.rsvp_id WHERE event_user_data.user_role = 'owner' AND rsvps.email = '#{current_user.email}'")
            #listing of invited events
            @invited_events = Event.find_by_sql("SELECT events.id, datetime, title from events INNER JOIN rsvps ON events.id = rsvps.event_id INNER JOIN event_user_data ON rsvps.id = event_user_data.rsvp_id WHERE event_user_data.user_role = 'guest' AND rsvps.email = '#{current_user.email}'")
            #rsvp response
            @event_rsvp = EventUserDatum.find_by_sql("SELECT rsvp_id, attending from event_user_data INNER JOIN rsvps ON rsvps.id = event_user_data.rsvp_id INNER JOIN events ON events.id = rsvps.event_id  WHERE event_user_data.user_role = 'guest' AND rsvps.email = '#{current_user.email}'")
            #function of concat invited_events and event_rsvp to populate within a single table in views
            @max_length = [@invited_events, @event_rsvp].map(&:size).max
        else
            # sign in
        end
    end

    def show
        @user = User.find(current_user.id)
        @event = @user.events.find(params[:id])

        #if params[:user_id].to_i != @event.user.id
            # error
        #end
    end

    def new
        @event = Event.new
        @user = User.find(params[:user_id])
    end

    def edit
        @user = User.find(current_user.id)
        @event = @user.events.find(params[:id])
    end

    def create
        @event = Event.new(event_params)
        @user = User.find(current_user.id)

        @event.save
        @user.events << @event

        #create entry in Rsvp model
        @rsvp = Rsvp.new(event_id: @user.events.last.id, user_id: current_user.id, name: current_user.username, email: current_user.email)
        @rsvp.save

        #create entry in event_user_datum model to link to rsvp model and state user_role as owner
        @eventuserdata = EventUserDatum.new(rsvp_id: @rsvp.id, user_role: :owner)
        @eventuserdata.save

        redirect_to user_events_path(@user)
    end

    def update
        @event = Event.find(params[:id])

        @event.update(event_params)
        redirect_to user_events_path(current_user.id)
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to user_events_path(current_user.id)
    end

private
    def event_params
      params.require(:event).permit(:datetime, :title, :user_ids => [])
    end
end
