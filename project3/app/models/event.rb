class Event < ApplicationRecord
    has_and_belongs_to_many :users_events
end
