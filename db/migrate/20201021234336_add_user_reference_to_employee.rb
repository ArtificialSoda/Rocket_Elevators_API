class AddUserReferenceToEmployee < ActiveRecord::Migration[5.2]
  def up
    add_reference :employees, :admin_user
  end
  def down
    remove_column :employees, :admin_user_id

  end
end
