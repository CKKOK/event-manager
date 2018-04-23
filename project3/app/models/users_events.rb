class UsersEvents < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :user_event_datum
end
