class EventsController < ApplicationController
    
    before_action :authenticate_user!#, :except => [ :show, :index ]

    def index
        #@event = Event.all
        
        if params[:user_id]
            @user = User.find(params[:user_id])
            @events = Event.all
            #@events = Event.where(user_id: params[:user_id])
        else
            @events = Event.all
        end
    end

    def show
        @event = Event.find(params[:id])
        @user = @event.users[0].id

        #if params[:user_id].to_i != @event.user.id
            # error
        #end
    end

    def new
        @event = Event.new
        @user = User.find(params[:user_id])
    end

    def edit
    end

    def create
        @event = Event.new(event_params)
        @user = User.find(User.ids)

        @event.save
        @user[0].events << @event
        redirect_to user_events_path(@user)
    end

    def update
    end

    def destroy
    end

private
    def event_params
      params.require(:event).permit(:datetime, :title, :user_ids => [])
    end
end
