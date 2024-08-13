class AddLicesnePlatetoVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :license_plate, :string
  end
end
