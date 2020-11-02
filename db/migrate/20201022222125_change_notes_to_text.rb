class ChangeNotesToText < ActiveRecord::Migration[5.2]
  def up
    change_column :building_details, :value, :text
    change_column :elevators, :notes, :text
  end
  def down
    change_column :building_details, :value, :string
    change_column :elevators, :notes, :string
  end


end
