class ChangeUsersToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :admin_users
  end
end
