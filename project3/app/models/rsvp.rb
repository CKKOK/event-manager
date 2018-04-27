class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_one :event_user_datum

  def self.to_csv
    attributes = %w{name email user_role relation attending diet additional_persons num_babies num_toddlers require_carpark message attended}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |r|
        e = r.event_user_datum
        csv << [r.name, r.email, e.user_role, e.relation, e.attending, e.diet, e.additional_persons, e.num_babies, e.num_toddlers, e.require_carpark, e.message, e.attended]
      end
    end
  end
end
