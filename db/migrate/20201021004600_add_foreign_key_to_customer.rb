class AddForeignKeyToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :admin_user
  end
end
