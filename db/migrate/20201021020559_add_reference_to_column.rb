class AddReferenceToColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :columns, :battery_id
    add_reference :columns, :battery
  end
  def down
    change_column :columns, :battery_id, :string
  end
end
