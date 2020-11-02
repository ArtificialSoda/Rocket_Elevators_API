class AddReferencesToBatteriesColumnsElevatorBuildingDetailsInCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :customer
    add_reference :columns, :customer
    add_reference :elevators, :customer
    add_reference :building_details, :customer
  end
end
