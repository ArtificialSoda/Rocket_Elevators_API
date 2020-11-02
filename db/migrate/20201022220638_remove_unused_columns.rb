class RemoveUnusedColumns < ActiveRecord::Migration[5.2]
  def up
    remove_column :batteries, :columns_id

    remove_column :customers, :user_id
  end
  def down
    add_reference :batteries, :columns
    add_column :customers, :user_id, :integer
  end
end
