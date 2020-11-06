class AddCustomerReferenceToLead < ActiveRecord::Migration[5.2]
  def up
    add_reference :leads, :customer
    #add_column :leads, :customer_id, :integer
  end
  def down#
    remove_reference :leads, :customer
    #remove_column :leads, :customer_id
  end
end
