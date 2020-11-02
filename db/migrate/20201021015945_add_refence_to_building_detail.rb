class AddRefenceToBuildingDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :building_details, :building
  end
end
