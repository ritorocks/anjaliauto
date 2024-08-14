class RemoveColumnFromJobs < ActiveRecord::Migration[7.1]
  def change
    remove_column :jobs, :status
  end
end
