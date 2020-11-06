class AddLatLngToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :latitude, :double
    add_column :addresses, :longitude, :double 
  end
end
