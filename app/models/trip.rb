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
end
