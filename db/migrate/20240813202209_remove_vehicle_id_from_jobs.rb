class RemoveVehicleIdFromJobs < ActiveRecord::Migration[7.1]
  def change
    remove_column :jobs, :vehicle_id
  end
end
