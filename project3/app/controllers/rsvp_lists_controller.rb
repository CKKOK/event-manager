class RsvpListsController < ApplicationController
    def index
        @events = Event.find(params[:event_id])
        @rsvp_lists = @events.rsvp_lists.all
    end

    def show
    end

    def new
        @event = Event.find(params[:event_id])
        @rsvp_list = RsvpList.new
    end

    def create
        @event = Event.find(params[:event_id])
        @rsvp_list = RsvpList.new(rsvplist_params)

        @rsvp_list.save
        #redirect_to user_events_path(current_user.id)
        redirect_to event_rsvp_lists_path(@event)
    end

    def edit
    end

    def update
    end

    def destroy
    end

private
    def rsvplist_params
      params.require(:rsvplist).permit(:name, :email, :key, :event_id)
    end
end
