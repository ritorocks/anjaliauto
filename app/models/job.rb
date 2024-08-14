# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  due_date    :date
#  due_time    :time
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer
#  trip_id     :integer
#
class Job < ApplicationRecord
  # Direct Associations
  #belongs_to :vehicle, required: true, class_name: "Vehicle", foreign_key: "vehicle_id", counter_cache: true
  belongs_to :employee, required: true, class_name: "Employee", foreign_key: "employee_id", counter_cache: :tasks_count
  belongs_to :trip, required: true, class_name: "Trip", foreign_key: "trip_id", counter_cache: false
end
