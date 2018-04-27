class UsersController < ApplicationController

    def index
    end

    def show
        @user = User.find(current_user.id)
        @back_url = session[:my_previous_url]
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end

private

  def user_params
    params.require(:user).permit(:event_ids => [])
  end
end
