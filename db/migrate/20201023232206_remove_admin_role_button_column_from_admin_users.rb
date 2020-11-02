class RemoveAdminRoleButtonColumnFromAdminUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :admin_users, :admin_role
  end

  def down
    add_column :admin_users, :admin_role, :boolean
  end
end
