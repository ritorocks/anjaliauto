#namespace :db do
 # desc "Generate sample data for vehicles"
  #task :create_sample_vehicles => :environment do
  #  require "faker"

   # 10.times do
    #   vehicle = Vehicle.new
    #   vehicle.color = Faker::Vehicle.color
   #    vehicle.image_url = Faker::Internet.url
   #    vehicle.jobs_count = rand(1..10)
   #    vehicle.make = Faker::Vehicle.make
   #    vehicle.model = Faker::Vehicle.model
   #    vehicle.name = Faker::Vehicle.manufacture
   #    vehicle.trips_count = rand(1..10)
   #    vehicle.year = Faker::Vehicle.year
   #    vehicle.save
  #   end

   #  puts "Sample vehicles data created successfully."
  # end
#end

namespace :db do
  desc "Populate the database with sample data for guests"
  task sample_guests: :environment do
    require 'faker'

    # Clear existing data
    Guest.delete_all

    # Create new sample data
    100.times do |i|
      id = i + 1
      trips_count = rand(5..100)
      turo_profile = "https://turo.com/us/en/drivers/#{rand(2180001..2180501)}"

      guest = Guest.new
      guest.id = id
      guest.name = Faker::Name.name
      guest.phone = Faker::PhoneNumber.phone_number
      guest.trips_count = trips_count
      guest.turo_profile = turo_profile
      guest.save
    end

    puts "Successfully populated the guests table with sample data."
  end
end

namespace :db do
  desc "Generate sample data for Employee model"
  task sample_employees: :environment do
    require "bcrypt"
    require 'faker'

    10.times do |i|
      employee = Employee.new
      employee.email = "employee#{i + 1}@example.com"
      employee.password = "password"
      employee.image_url = "https://robohash.org/#{i + 1}?set=set5"
      employee.name = Faker::Name.name
      employee.title = "Title #{i + 1}"
      employee.save

      puts employee.errors.full_messages
    end

    puts "Created 10 sample employees."
  end
end
