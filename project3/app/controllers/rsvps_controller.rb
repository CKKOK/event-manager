# frozen_string_literal: true

# Specifications
# ==============
# Rsvps have :event_id, :event_user_datum_id (pending), :name, :email, and :key
# :key is nil for users with an account

# Notes
# =====
# We use find_by_??? here so that a nil result can be returned instead of having Rails throw an error.
# To find a user by email: User.find_by_email(rsvp[:email])
# To find an event: Event.find_by_id(rsvp[:event_id])
# To find an event user datum: EventUserDatum.find_by_id(rsvp[:event_user_datum_id])

# Flow Control
# ============
# ../events/:event_id/rsvps
# [logged in, owner] rsvp list associated with the event
# [logged in, guest] redirect to rsvp if exists or root otherwise
# [not logged in, key] redirect to new/edit rsvp if key is valid or root otherwise
# [not logged in, no key] redirect to root

# ../events/:event_id/rsvps/:id
# [logged in, owner] show that particular rsvp response
# [logged in, guest] if not his own rsvp, redirect to his own rsvp if exists or root otherwise
# [not logged in, key or no key] redirect to root

# ../events/:event_id/rsvps/new
# [logged in, owner] form for creating new rsvps for event
# [logged in, guest] [not logged in] redirect to user_events (for guest) or root (otherwise)

# ../events/:event_id/rsvps/:id/edit
# [logged in, owner] edit the rsvp list
# [logged in, guest] edit his own response if rsvp belongs to him or redirect to root otherwise
# [not logged in, key] edit response
# [not logged in] redirect to root

# ../events/:event_id/rsvps/:id/update
# update a single invitation. AJAX call? (remote: true)

# ../events/:event_id/rsvps/:id/delete
# delete a single invitation. AJAX call? (remote: true)

# ../rsvps

# Q&A
# ===
# Question: What if the user signs up while having outstanding RSVPs?
# Proposal: Nothing. The check for RSVPs is done via email.

# Template code to account for the above directions
# =================================================
# case logged_in?
#   when true # ___LOGGED IN
#     @event = Event.find_by_id(params[:event_id])
#     case is_owner?(@event, current_user)
#       when true # ___IS OWNER
#         DO OWNER STUFF
#       when false
#         if is_invited?(@event, current_user) # ___IS GUEST
#           DO GUEST STUFF
#         else # ___IS NEITHER OWNER NOR GUEST
#           DO BAD STUFF
#         end
#       end
#   when false # ___NOT LOGGED IN
#     case key.nil?
#       when true # ___HAS NO KEY
#         DO BAD STUFF
#       when false # ___HAS KEY
#         @rsvp = Rsvp.find_by_key(params[:key])
#         if @rsvp.nil? # ___KEY IS INVALID
#           DO BAD STUFF
#         else # ___KEY IS VALID (i.e. USER DOES NOT EXIST IN SYSTEM YET)
#           DO STUFF
#         end
#       end
#   end

require 'bcrypt' # For encrypting the email + event_id for users without accounts
require 'csv' # For exporting RSVPs as a csv file for download

class RsvpsController < ApplicationController

  def index
    case logged_in?
      when true # ___LOGGED IN
        @event = Event.find_by_id(params[:event_id]) 

        if @event.nil?
          redirect_to user_events_path(current_user)
          return
        end

        case is_owner?(@event, current_user)
          when true # ___IS OWNER
            @user_role = :owner
            @rsvps = @event.rsvps
          when false
            if is_invited?(@event, current_user) # ___IS GUEST
              rsvp = @event.rsvps.find_by_email(current_user.email)
              redirect_to edit_user_event_rsvp_path(current_user, @event, rsvp)
              return
            else # ___IS NEITHER OWNER NOR GUEST
              redirect_to user_events_path(current_user)
              return
            end
          end

      when false # ___NOT LOGGED IN

        case key.nil?
          when true # ___HAS NO KEY
            redirect_to root_path
            return
          when false # ___HAS KEY
            rsvp = Rsvp.find_by_key(params[:key])
            if rsvp.nil? # ___KEY IS INVALID
              redirect_to root_path
              return
            else # ___KEY IS VALID (i.e. USER DOES NOT EXIST IN SYSTEM YET)
              redirect_to edit_rsvp_path(rsvp, key: params[:key], attending: params[:attending])
              return
            end
          end
      end
  end

  def show
    case logged_in?
      when true # ___LOGGED IN
        @event = Event.find_by_id(params[:event_id])
        case is_owner?(@event, current_user)
          when true # ___IS OWNER
            @rsvp = Rsvp.find_by_id(params[:id])
            @event_user_datum = @rsvp.event_user_datum
            @user_role = :owner
          when false
            if is_invited?(@event, current_user) # ___IS GUEST
              @rsvp = Rsvp.find_by_id(params[:id])
              if @rsvp[:email] == current_user[:email] # Check that the rsvp is indeed for the user
                @user_role = :guest
              else
                flash[:notice] = 'That invitation is not for you!'
                redirect_to user_events_path(current_user)
                return
              end
            else # ___IS NEITHER OWNER NOR GUEST
              flash[:notice] = 'Sorry but you weren\'t invited to that event!'
              redirect_to user_events_path(current_user)
              return
            end
          end
      when false # ___NOT LOGGED IN
        redirect_to root_path
        return
      end
  end

  def new
    case logged_in?
      when true # ___LOGGED IN
        @event = Event.find_by_id(params[:event_id])
        case is_owner?(@event, current_user)
          when true # ___IS OWNER
          when false
            redirect_to user_events_path(current_user)
            return
          end
      when false # ___NOT LOGGED IN
        redirect_to root_path
        return
      end
  end

  def create
    @event = Event.find(params[:event_id])
    rsvps = params[:rsvp].values.reject do |rsvp|
      rsvp.values.any? &:blank?
    end
    rsvps.each { |rsvp| 
      if user_email_exists?(rsvp[:email]) 
        rsvp[:key] = nil
        user = User.find_by_email(rsvp[:email])
        tmp = Rsvp.create! rsvp
        tmp.user = user
        tmp_event_user_datum = tmp.create_event_user_datum(user_role: :guest)
        tmp_event_user_datum.save
      else
        tmpstring = rsvp[:email] + rsvp[:event_id].to_s
        rsvp[:key] = BCrypt::Password.create(tmpstring).to_s
        tmp = Rsvp.create! rsvp
        tmp_event_user_datum = tmp.create_event_user_datum(user_role: :guest)
        tmp_event_user_datum.save
      end
      RsvpMailer.with(sender: current_user.username, rsvp: tmp).rsvp_email.deliver_later
    }
    if rsvps.length > 0
      flash[:notice] = "Created #{rsvps.length} #{'invitation'.pluralize(rsvps.length)}"
    end
    redirect_to event_rsvps_path(@event)
    return
  end

  def edit
    case logged_in?
      when true # ___LOGGED IN
        @event = Event.find_by_id(params[:event_id])
        case is_owner?(@event, current_user)
          when true # ___IS OWNER
            @user_role = :owner
            @user = current_user
            @rsvps = Rsvp.where(:event_id => @event[:id])
          when false
            if is_invited?(@event, current_user) # ___IS GUEST
              @user_role = :guest
              @rsvp = @event.rsvps.where(:email => current_user[:email]).first
              @event_user_datum = @rsvp.event_user_datum
            else # ___IS NEITHER OWNER NOR GUEST
              redirect_to user_events_path(current_user)
              return
            end
          end
      when false # ___NOT LOGGED IN
        case key.nil?
          when true # ___HAS NO KEY
            redirect_to root_path
          when false # ___HAS KEY
            @rsvp = Rsvp.find_by_key(params[:key])
            if @rsvp.nil? # ___KEY IS INVALID
              redirect_to root_path
              return
            else # ___KEY IS VALID (i.e. USER DOES NOT EXIST IN SYSTEM YET)
              @user_role = :guest
              @event = Event.find_by_id(params[:event_id])
              @owner = @rsvp.event.rsvps.where(event_user_datum: EventUserDatum.where(user_role: 'owner')).first.name
              @event_user_datum = @rsvp.event_user_datum
            end
          end
      end
  end

  def update
    # Updates only a single record. Deal with this via AJAX?
    rsvp = Rsvp.find(params[:id])
    # if user_email_exists?(params[:email])
    #   params[:key] = nil
    #   # send email out
    # else
    #   params[:key] = BCrypt::Password.new(params[:email] << params[:event_id].to_s)
    #   # send email out
    # end
    rsvp.update(rsvp_update_params)
    # redirect_to root_path
    head :ok, :content_type => 'text/html'
  end

  def destroy
    # Deletes a single record. Deal with this via AJAX?
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy
    # redirect_to root_path
    head :ok, :content_type => 'text/html'
  end

  def export
    rsvps = Rsvp.where(:event_id => params[:event_id])
    title = Event.find(params[:event_id]).title
    respond_to do |format|
      format.html { send_data rsvps.to_csv, filename: "#{title}-rsvps-#{Date.today}.csv" }
    end
  end

  private

  def user_email_exists?(email)
    User.where(:email => email).exists?
  end

  def logged_in?
    !current_user.nil?
  end

  def is_owner?(event, user)
    if event.nil? || user.nil?
      return false
    end
    event.users.where(rsvps: EventUserDatum.where(user_role: "owner")).first == user
  end
  
  def is_invited?(event, user)
    if event.nil? || user.nil?
      return false
    end
    event.users.where(rsvps: EventUserDatum.where(user_role: "guest")).first == user
  end

  def key
    params[:key]
  end

  def rsvp_params
    params.require(:rsvp).permit(:event_id, :name, :email)
  end

  def rsvp_update_params
    params.require(:rsvp).permit(:name, :email)
  end
end
