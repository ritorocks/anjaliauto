# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  name        :string
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :integer
#  vehicle_id  :integer
#
class Job < ApplicationRecord
  # Direct Associations
  belongs_to :vehicle, required: true, class_name: "Vehicle", foreign_key: "vehicle_id", counter_cache: true
  belongs_to :employee, required: true, class_name: "Employee", foreign_key: "employee_id", counter_cache: :tasks_count
end
