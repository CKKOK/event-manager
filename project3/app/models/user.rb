class User < ApplicationRecord
  validates :username, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rsvps
  has_many :event_user_data, through: :rsvps
  has_and_belongs_to_many :events
end
