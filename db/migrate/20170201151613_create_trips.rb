class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :start_event_id
      t.string :end_event_id

      t.timestamps
    end
  end
end
