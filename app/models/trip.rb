# == Schema Information
#
# Table name: trips
#
#  id                      :integer          not null, primary key
#  end_date                :date
#  end_day                 :string
#  end_time                :time
#  estimated_earnings      :integer
#  extras                  :string
#  start_date              :date
#  start_day               :string
#  start_time              :time
#  total_distance_included :integer
#  turo_reservation_number :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  guest_id                :integer
#  location_id             :integer
#  vehicle_id              :integer
#
class Trip < ApplicationRecord
  #validates :id, presence: true
  validates :id, uniqueness: true

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :turo_reservation_number, presence: true
  validates :extras, presence: true
  validates :total_distance_included, presence: true
  #validates :location_id, presence: true
  validates :vehicle_id, presence: true

  # Direct Associations
  belongs_to :vehicle, required: true, class_name: "Vehicle", foreign_key: "vehicle_id", counter_cache: true
  belongs_to :guest, required: true, class_name: "Guest", foreign_key: "guest_id", counter_cache: true
  #belongs_to :location, required: true, class_name: "Location", foreign_key: "location_id", counter_cache: true

  def create_jobs
    jobs_data = if self.extras == "None"
        [
                    { :name => "Check-in", :due_date => self.start_date - 1, :due_time => self.start_time - 16.hours },
                    { :name => "Check-out", :due_date => self.end_date + 1, :due_time => self.end_time + 16.hours },
                    { :name => "Car Detail", :due_date => self.start_date - 1, :due_time => self.start_time - 12.hours },
                  ]
      elsif self.extras == "Prepaid Fuel"
        [
                    { :name => "Check-in", :due_date => self.start_date - 1, :due_time => self.start_time - 16.hours },
                    { :name => "Check-out", :due_date => self.end_date + 1, :due_time => self.end_time + 16.hours },
                    { :name => "Fuel Service", :due_date => self.end_date + 1, :due_time => self.end_time + 12.hours },
                    { :name => "Car Detail", :due_date => self.start_date - 1, :due_time => self.start_time - 12.hours },
                  ]
      elsif self.extras == "Childseat Rental"
        [
                    { :name => "Check-in", :due_date => self.start_date - 1, :due_time => self.start_time - 16.hours },
                    { :name => "Check-out", :due_date => self.end_date + 1, :due_time => self.end_time + 16.hours },
                    { :name => "Car Detail", :due_date => self.start_date - 1, :due_time => self.start_time - 12.hours },
                    { :name => "Load Childseat", :due_date => self.start_date - 1, :due_time => self.start_time - 3.hours },
                  ]
      else
        []
      end

    employee_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,]

    jobs_data.each do |job_data|
      job = Job.new
      job.name = job_data.fetch(:name)
      job.due_date = job_data.fetch(:due_date)
      job.due_time = job_data.fetch(:due_time)
      job.trip_id = self.id
      job.employee_id = employee_ids.sample # randomly assign employee
      job.save
    end
  end
end
