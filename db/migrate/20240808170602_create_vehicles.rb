class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :image_url
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.integer :trips_count
      t.integer :jobs_count

      t.timestamps
    end
  end
end
