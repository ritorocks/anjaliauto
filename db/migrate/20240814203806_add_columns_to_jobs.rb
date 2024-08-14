class AddColumnsToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :due_date, :date
    add_column :jobs, :due_time, :time
    add_column :jobs, :completed, :boolean
  end
end
