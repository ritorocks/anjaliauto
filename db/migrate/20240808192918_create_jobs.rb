class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.boolean :status
      t.integer :vehicle_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
