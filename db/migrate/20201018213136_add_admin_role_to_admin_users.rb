class AddAdminRoleToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :admin_role, :boolean, default: false
  end
end
