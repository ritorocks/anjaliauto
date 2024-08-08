class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :turo_profile
      t.integer :phone
      t.integer :trips_count

      t.timestamps
    end
  end
end
