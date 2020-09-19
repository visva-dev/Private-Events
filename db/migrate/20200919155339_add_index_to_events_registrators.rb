class AddIndexToEventsRegistrators < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :attendee_id
    add_index :events, :attended_event_id
  end
end
