# frozen_string_literal: true

class EventsRegistrator < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
