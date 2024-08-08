# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string
#  trips_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Location < ApplicationRecord
  # Direct Association
  has_many  :trips, class_name: "Trip", foreign_key: "location_id", dependent: :nullify
end
