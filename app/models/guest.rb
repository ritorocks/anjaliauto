# == Schema Information
#
# Table name: guests
#
#  id           :integer          not null, primary key
#  name         :string
#  phone        :integer
#  trips_count  :integer
#  turo_profile :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Guest < ApplicationRecord
end
