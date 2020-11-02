class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.integer :no_of_appartments
      t.integer :no_of_floors
      t.integer :no_of_basements
      t.integer :no_of_elevators_cages
      t.integer :no_of_parking_spaces
      t.integer :no_of_tenant_companies
      t.integer :no_of_distinct_businesses
      t.integer :max_occupants_per_floors

      t.timestamps
    end
  end
end
