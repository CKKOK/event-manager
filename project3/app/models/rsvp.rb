class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_one :event_user_datum
end
