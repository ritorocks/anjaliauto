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
  has_many  :trips, class_name: "Trip", foreign_key: "vehicle_id"
  
end
