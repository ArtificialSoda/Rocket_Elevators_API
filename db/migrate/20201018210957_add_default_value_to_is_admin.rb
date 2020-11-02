class AddDefaultValueToIsAdmin < ActiveRecord::Migration[5.2]
  def change
    change_column_default :admin_users, :is_admin, false
  end
end
