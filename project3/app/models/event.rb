# frozen_string_literal: true

class Event < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :rsvps, dependent: :destroy
    has_many :event_user_data, through: :rsvps, dependent: :destroy
end
