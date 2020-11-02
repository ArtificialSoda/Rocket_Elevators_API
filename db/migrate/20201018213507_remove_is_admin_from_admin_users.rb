class RemoveIsAdminFromAdminUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :is_admin, :boolean
  end
end
