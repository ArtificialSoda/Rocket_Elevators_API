class AddIsAdminToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :is_admin, :boolean
  end
end
