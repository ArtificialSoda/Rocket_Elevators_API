class AddReferenceToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :customer
  end
end
