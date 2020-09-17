class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :events_registrator
  has_many :attended_events, through: :events_registrator, source: :attended_event
end
