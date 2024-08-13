# == Schema Information
#
# Table name: vehicles
#
#  id            :integer          not null, primary key
#  color         :string
#  image         :string
#  jobs_count    :integer
#  license_plate :string
#  make          :string
#  model         :string
#  name          :string
#  trips_count   :integer
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Vehicle < ApplicationRecord
  validates :id, presence: true
  validates :id, uniqueness: true

 # validates :license_plate, presence: true
 # validates :license_plate, uniqueness: true

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :color, presence: true

  # Direct associations
  has_many  :trips, class_name: "Trip", foreign_key: "vehicle_id"
  has_many  :jobs, class_name: "Job", foreign_key: "vehicle_id", dependent: :destroy

  # Indirect associations
  has_many :guests, through: :trips, source: :guest
end
