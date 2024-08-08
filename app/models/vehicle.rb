# == Schema Information
#
# Table name: vehicles
#
#  id          :integer          not null, primary key
#  color       :string
#  image_url   :string
#  jobs_count  :integer
#  make        :string
#  model       :string
#  name        :string
#  trips_count :integer
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Vehicle < ApplicationRecord
  # Direct associations
  has_many  :trips, class_name: "Trip", foreign_key: "vehicle_id"
  has_many  :jobs, class_name: "Job", foreign_key: "vehicle_id", dependent: :destroy

  # Indirect associations
  has_many :guests, through: :trips, source: :guest
end
