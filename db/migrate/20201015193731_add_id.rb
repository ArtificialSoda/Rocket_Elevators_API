class AddId < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :num_elevators, :int
    add_column :quotes, :product_grade, :string
    add_column :quotes, :elevator_cost, :int
    add_column :quotes, :installation_cost, :int
    add_column :quotes, :total_cost, :int
  end
end
