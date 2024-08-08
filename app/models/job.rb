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
end
