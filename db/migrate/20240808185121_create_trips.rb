class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.integer :turo_reservation_number
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.integer :vehicle_id
      t.integer :guest_id
      t.integer :total_distance_included
      t.integer :estimated_earnings
      t.string :start_day
      t.string :end_day
      t.string :extras
      t.integer :location_id

      t.timestamps
    end
  end
end
