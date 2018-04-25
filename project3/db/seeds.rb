# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

User.destroy_all
Event.destroy_all
Rsvp.destroy_all
EventsUsers.destroy_all
EventUserDatum.destroy_all

user = User.new(
  username: "Bojack Horseman",
  email: "abc@123.com", 
  password: "123456", 
  password_confirmation: "123456"
)
user.save!

event = Event.create(title: "The Distracted Globe", datetime: Time.now.to_datetime)

rsvp_1 = Rsvp.create(
  event_id: event.id,
  name: user.username,
  email: user.email,
  key: ""
)

name = "Princess Caroline"
email = "mmm@meow.com"
key = BCrypt::Password.create(name << email)

rsvp_2 = Rsvp.create(
  event_id: event.id,
  name: name,
  email: email,
  key: key
)

# eventuser = EventsUsers.create()

# eventuserdata = EventUserDatum.create()
