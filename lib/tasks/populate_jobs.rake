namespace :populate do
  desc "Populate jobs table with records based on trips and employees"
  task :jobs => :environment do
    employee_ids = [1,2,3,4,5,6,7,8,9,10]

    Trip.find_each do |trip|
      jobs_data = if trip.extras == "None"
                    [
                      { :name => "Check-in", :due_date => trip.start_date - 1, :due_time => trip.start_time - 16.hours },
                      { :name => "Check-out", :due_date => trip.end_date + 1, :due_time => trip.end_time + 16.hours },
                      { :name => "Car Detail", :due_date => trip.start_date - 1, :due_time => trip.start_time - 12.hours }
                    ]
                  elsif trip.extras == "Prepaid Fuel"
                    [
                      { :name => "Check-in", :due_date => trip.start_date - 1, :due_time => trip.start_time - 16.hours },
                      { :name => "Check-out", :due_date => trip.end_date + 1, :due_time => trip.end_time + 16.hours },
                      { :name => "Fuel Service", :due_date => trip.end_date + 1, :due_time => trip.end_time + 12.hours },
                      { :name => "Car Detail", :due_date => trip.start_date - 1, :due_time => trip.start_time - 12.hours }
                    ]
                  elsif trip.extras == "Childseat Rental"
                    [
                      { :name => "Check-in", :due_date => trip.start_date - 1, :due_time => trip.start_time - 16.hours },
                      { :name => "Check-out", :due_date => trip.end_date + 1, :due_time => trip.end_time + 16.hours },
                      { :name => "Car Detail", :due_date => trip.start_date - 1, :due_time => trip.start_time - 12.hours },
                      { :name => "Load Childseat", :due_date => trip.start_date - 1, :due_time => trip.start_time - 3.hours }
                    ]
                  else
                    []
                  end

      jobs_data.each do |job_data|
        job = Job.new
        job.name = job_data.fetch(:name)
        job.due_date = job_data.fetch(:due_date)
        job.due_time = job_data.fetch(:due_time)
        job.trip_id = trip.id
        job.employee_id = employee_ids.sample # randomly assign employee
        job.save
      end
    end

    puts "Jobs table populated successfully."
  end
end
