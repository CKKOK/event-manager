# frozen_string_literal: true

require 'bcrypt'

class RsvpsController < ApplicationController
  # Rsvps have :event_id :name :email :key
  # Check for the user by doing User.find_by_email(rsvp[:email])

  # ../events/:event_id/rsvps - [logged in, owner] rsvp list associated with the event, [logged in, guest] redirect to rsvp if exists or root otherwise, [not logged in, key] redirect to new/edit rsvp if key is valid or root otherwise, [not logged in, no key] redirect to root

  # ../events/:event_id/rsvps/:id - [logged in, owner] show the rsvp response, [logged in, guest] if not his own rsvp, redirect to his own rsvp if exists or root otherwise, [not logged in, key] redirect to rsvp, [not logged in, no key] redirect to root

  # ../events/:event_id/rsvps/new - [logged in, owner] form for creating new rsvp list for event, [logged in, guest] [not logged in] redirect to rsvp if exists or root otherwise

  # ../events/:event_id/rsvps/:id/edit - [logged in, owner] edit the rsvp list, [logged in, guest] edit his own response if rsvp belongs to him or redirect to root otherwise, [not logged in, key] edit response, [not logged in, no key] redirect to root

  # ../events/:event_id/rsvps/:id/delete - [logged in, owner] delete an invitation (or a bunch of invitations) then redirects to event page

  # case logged_in?
  # when true
  #   @event = Event.find_by_id(params[:event_id])
  #   case is_owner?(@event, current_user)
  #   when true
  #     @rsvps = Rsvp.where(:event_id => @event[:id])
  #   when false
  #     if is_invited?(@event, current_user)
  #       @rsvp = Rsvp.where(:event_id => @event[:id], :email => current_user[:email])
  #       redirect_to edit_user_event_rsvp_path(current_user, @event, @rsvp)
  #     else
  #       redirect_to user_events_path(current_user)
  #     end
  #   end
  # when false
  #   case key.nil?
  #   when true
  #     redirect_to root_path
  #   when false
  #     @event = Event.find_by_id(params[:event_id])
  #     @rsvp = Rsvp.find_by_key(params[:key])
  #     if @rsvp.nil?
  #       redirect_to root_path
  #     else
  #       redirect_to edit_event_rsvp_path(@event, @rsvp)
  #     end
  #   end
  # end

  def index
    # event/:event_id/rsvps
    # RSVP can be obtained from rsvp.where(event_id: :event_id)
    # Event can always be obtained from :event_id as the rsvp_list is a sub-resource of event. However, we need to check if there is a :user_id present. Because if there is, is he attempting to create/edit a rsvp list? Or is he attempting to rsvp to an event?
    @rsvp = Rsvp.find_by_key(params[:key])

    # if the rsvp does not exist, we check for the presence of a user. if the user does not exist, redirect to the homepage, else redirect to the user's dashboard.
    # if the rsvp exists and the user arrived via a key, he is not a pre-existing user of the system. Then, get the event_id from the rsvp object and direct him to the edit_event_rsvp_path.
    # if the rsvp exists and the user did not arrive via a key, he is a system user. Get the event_id from the rsvp object, then redirect him to the edit_user_event_rsvp_path. Let the edit_user_event_rsvp controller decide whether to render the edit rsvp or reply rsvp form.

    if @rsvp.nil?
      if current_user.nil?
        redirect_to root_path
      else
        redirect_to user_events_path(current_user)
      end
    else
      @event = Event.find_by_id(@rsvp[:event_id])
      if current_user.nil?
        redirect_to edit_event_rsvp_path(@event, @rsvp)
      else
        redirect_to edit_user_event_rsvp_path(current_user, @event, @rsvp)
      end
    end
  end

  def show
    # This should show the rsvps for a particular event
    @rsvps = Rsvp.where(:event_id => params[:event_id])
    render :json => @rsvps
  end

  def new
    @rsvp_list = Rsvp.new
  end

  def create
    # This is going to need to create a tonne of stuff from the form data, i.e. each line on the form corresponds to one row in the rsvps database
    # Bcrypt the email address and event_id by doing BCrypt::Password.new(email_address << :event_id)
    # event_id = params[:event_id]
    # key = BCrypt::Password.new(email_address << event_id.to_s)
  end

  def edit
    # if there is no user, he is assumed to be replying to an invitation.
    # if there is one, and he is the event's owner, he is assumed to be editing the invite list.
    # otherwise, he is assumed to be replying to an invitation.
    @rsvp = Rsvp.find_by_id(params[:id])
    @event = Event.find_by_id(params[:event_id])
    @user = User.find_by_email(@rsvp[:email]) if !@rsvp.nil?
    
    if @rsvp.nil? || @event.nil?
      puts "Invalid rsvp or event id"
      return
    end

    if !@user.nil?
      # the user role can be found by looking up user_event_data, event_id and user_id, get corresponding user_event_datum_id, and get the user_role field.
      @event_user = EventsUsers.where(:user_id => params[:user_id], :event_id => params[:event_id])
      @event_user_datum = EventUserDatum.find_by_id(@event_user[:event_user_datum_id])
      @user_role = @event_user_datum[:user_role]
    end

    if @user.nil? || @user_role != 'organizer'
      puts "Either user not specified, or he is a guest"
    else
      puts "User is an organizer"
    end
  end

  def update; end

  def destroy; end

  def reply
    # event/:event_id/rsvp_list/:id/reply
    # RsvpList can be obtained from rsvp_list.where(event_id: :event_id)
    # Event can be obtained from :event_id.
    # User has to be inferred from the email, i.e. user = user.find_by(:email, )
    # This one should redirect to the appropriate users_events_data
    # Bcrypt the email address and event_id by doing BCrypt::Password.new(email_address << :event_id)
  end

  private

  def logged_in?
    !params[:user_id].nil? || !current_user.nil?
  end

  def is_owner?(event, user)
    @event_user = EventsUsers.where(:user_id => user[:id], :event_id => event[:id])

    if @event_user.nil?
      return false
    end

    @event_user_datum = EventUserDatum.find_by_id(@event_user[:event_user_datum_id])
    @user_role = @user_event_datum[:user_role]
    @user_role == 'organizer'
  end
  
  def is_invited?(event, user)
    @event_user = EventsUsers.where(:user_id => user[:id], :event_id => event[:id])

    if @event_user.nil?
      return false
    end

    @event_user_datum = EventUserDatum.find_by_id(@event_user[:event_user_datum_id])
    @user_role = @event_user_datum[:user_role]
    @user_role == 'guest'
  end

  def key
    params[:key]
  end
end
