class ChangeIntToDouble < ActiveRecord::Migration[5.2]
  def up 
    change_column :quotes, :elevator_cost, :float
    change_column :quotes, :installation_cost, :float
    change_column :quotes, :total_cost, :float
  end
  def down
    change_column :quotes, :elevator_cost, :integer 
    change_column :quotes, :installation_cost, :integer
    change_column :quotes, :total_cost, :integer
  end
end
