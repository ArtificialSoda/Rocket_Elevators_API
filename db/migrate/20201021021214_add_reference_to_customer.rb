class AddReferenceToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :address
  end
  
end
