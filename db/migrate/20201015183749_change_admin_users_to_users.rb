class ChangeAdminUsersToUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    rename_table :admin_users, :users
  end
end
