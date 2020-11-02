class AddReferenceToElevators < ActiveRecord::Migration[5.2]
  def up
    remove_column :elevators, :column_id
    add_reference :elevators, :column
  end
  def down
    change_column :elevators, :column_id, :string
  end
end
