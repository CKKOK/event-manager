class UsersEvents < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :user_event_datum
end
