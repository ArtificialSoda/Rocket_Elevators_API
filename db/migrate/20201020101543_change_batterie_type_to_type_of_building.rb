class ChangeBatterieTypeToTypeOfBuilding < ActiveRecord::Migration[5.2]
  def up
    rename_column :batteries, :type, :type_of_building
  end
  def down
    rename_column :batteries, :type_of_building, :type
  end
end

  

