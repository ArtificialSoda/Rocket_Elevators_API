class ChangeTypeToTypeOfBuilding < ActiveRecord::Migration[5.2]
  def up
    rename_column :columns, :type, :type_of_building
  end
  def down
    rename_column :columns, :type_of_building, :type
  end
end
