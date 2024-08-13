class AddTripIdToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :trip_id, :integer
  end
end
