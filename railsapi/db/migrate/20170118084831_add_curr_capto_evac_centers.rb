class AddCurrCaptoEvacCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :evac_centers, :currcap, :integer
  end
end
