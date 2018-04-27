# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if !current_user.nil?
      redirect_to users_path(current_user)
    end
  end
end
