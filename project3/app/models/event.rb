class Event < ApplicationRecord
    #has_and_belongs_to_many :users_events
    #has_one :rsvp_list
    has_and_belongs_to_many :users
    has_many :rsvp_lists
    has_many :user_event_datum
end
