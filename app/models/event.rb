class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :events_registrator
  has_many :attendee, through: :events_registrator
end
