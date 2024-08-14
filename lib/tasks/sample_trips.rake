namespace :db do
  desc "Create sample trips"
  task sample_trips: :environment do
    require "date"
    require "time"

    start_date = Date.new(2024, 1, 1)
    end_date = Date.new(2024, 12, 31)
    turo_reservation_number = 34108900

    trip_durations = { 1 => 15, 3 => 15, 5 => 25, 10 => 25, 14 => 20 }
    total_trips = 100
    trips_in_past = 60
    trips_in_future = total_trips - trips_in_past

    create_trips = lambda do |number_of_trips, in_past|
      number_of_trips.times do
        duration = trip_durations.keys.sample
        trip_durations[duration] -= 1 if trip_durations[duration] > 0
        days_offset = rand(1..365) * (in_past ? -1 : 1)
        start_date = Date.today + days_offset
        end_date = start_date + duration

        start_time = Time.parse("#{rand(6..23)}:00")
        end_time = Time.parse("#{rand(6..23)}:00")

        Trip.create({
          :start_date => start_date,
          :end_date => end_date,
          :start_time => start_time,
          :end_time => end_time,
          :start_day => start_date.strftime("%A"),
          :end_day => end_date.strftime("%A"),
          :total_distance_included => duration * 250,
          :turo_reservation_number => turo_reservation_number,
          :guest_id => rand(1..100),
          :vehicle_id => rand(1..10),
          :extras => ["None", "Prepaid Fuel", "Childseat Rental"].sample
        })

        turo_reservation_number += 1
      end
    end

    create_trips.call(trips_in_past, true)
    create_trips.call(trips_in_future, false)
    puts "100 trips have been successfully created."
  end
end
