# == Schema Information
#
# Table name: trips
#
#  id                      :integer          not null, primary key
#  end_date                :date
#  end_day                 :datetime
#  end_time                :time
#  estimated_earnings      :integer
#  extras                  :string
#  start_date              :date
#  start_day               :datetime
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
end
