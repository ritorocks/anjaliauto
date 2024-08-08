namespace :db do
  desc "Generate sample data for vehicles"
  task :create_sample_vehicles => :environment do
    require "faker"

    10.times do
      vehicle = Vehicle.new
      vehicle.color = Faker::Vehicle.color
      vehicle.image_url = Faker::Internet.url
      vehicle.jobs_count = rand(1..10)
      vehicle.make = Faker::Vehicle.make
      vehicle.model = Faker::Vehicle.model
      vehicle.name = Faker::Vehicle.manufacture
      vehicle.trips_count = rand(1..10)
      vehicle.year = Faker::Vehicle.year
      vehicle.save
    end

    puts "Sample vehicles data created successfully."
  end
end
