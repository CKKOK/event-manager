class UsersEventsDataController < ApplicationController
    def index
        # this should never be accessed.
    end

    def show
        # we need to show the rsvp response here
    end

    def new
        if !params[:key].nil?
            key = params[:key]
            # retrieve the key from the rsvp_list database
            # check if the user_event_datum exists. if it does, redirect the user to the edit view (the params should be preserved). if it doesn't, render the form.
        else
            # either the user exists in the system, or the rsvp is invalid.
            # if the user is logged in, 
            # check if the user_event_datum exists. if it does, render the form with this data
            # otherwise, redirect to the login page.
        end
    end

    def create

    end

    def edit
        if !params[:key].nil?
            key = params[:key]
            # retrieve the key from the rsvp_list database
            # check if the user_event_datum exists. if it does, render the form with this data
        else
            # either the user exists in the system, or the rsvp is invalid.
            # if the user is logged in, 
            # check if the user_event_datum exists. if it does, render the form with this data
            # otherwise, redirect to the login page.
        end
    end

    def update
        # ignore where this came from. this function's purpose is simply to update the form. leave the routing to the edit function.
    end

    def destroy
        # do we want the functionality to destroy the user_event_datum?
    end
end
