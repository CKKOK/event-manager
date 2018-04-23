class EventsController < ApplicationController
    before_action :authenticate_user!, :except => [ :show, :index ]
    def index
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
