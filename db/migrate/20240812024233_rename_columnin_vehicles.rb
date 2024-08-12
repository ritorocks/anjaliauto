class RenameColumninVehicles < ActiveRecord::Migration[7.1]
  def change
    rename_column :vehicles, :image_url, :image
  end
end
