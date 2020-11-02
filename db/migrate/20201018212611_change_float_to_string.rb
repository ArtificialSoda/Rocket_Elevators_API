class ChangeFloatToString < ActiveRecord::Migration[5.2]
  def up
    change_column :quotes, :elevator_cost, :string
    change_column :quotes, :installation_cost, :string
    change_column :quotes, :total_cost, :string
  end
  def down
    change_column :quotes, :elevator_cost, :integer 
    change_column :quotes, :installation_cost, :integer
    change_column :quotes, :total_cost, :integer

    # Used integer in this case to revert back to the variable type before change_int_to_double migration
  end  
end
