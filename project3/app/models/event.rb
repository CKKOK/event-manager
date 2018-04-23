class Event < ApplicationRecord
    has_and_belongs_to_many :users_events
    has_one :rsvp_list
end
