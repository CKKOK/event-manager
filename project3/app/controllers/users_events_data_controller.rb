class UsersEventsDataController < ApplicationController
    def index
    end

    def show
    end

    def new
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
    end

    def destroy
    end
end
