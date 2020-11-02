class ChangeElevatorTypeColumnName < ActiveRecord::Migration[5.2]
  def up
    rename_column :elevators, :type, :type_of_building
  end
  def down
    rename_column :elevators, :type_of_building, :type
  end
end
