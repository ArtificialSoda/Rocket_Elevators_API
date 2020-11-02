class AddressReferenceToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :address
  end
end
