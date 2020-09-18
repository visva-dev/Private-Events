# frozen_string_literal: true

class CreateEventsRegistrators < ActiveRecord::Migration[6.0]
  def change
    create_table :events_registrators do |t|
      t.integer :attendee_id
      t.integer :attended_event_id
      t.timestamps
    end
  end
end
