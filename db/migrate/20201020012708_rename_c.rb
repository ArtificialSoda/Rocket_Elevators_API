class RenameC < ActiveRecord::Migration[5.2]
  def up
    rename_column :addresses, :nation, :country
  end
  def down
    rename_column :addresses, :country, :nation
  end
end
