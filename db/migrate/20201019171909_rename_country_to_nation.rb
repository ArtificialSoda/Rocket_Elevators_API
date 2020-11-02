class RenameCountryToNation < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :addresses, :country, :nation
  end

  def self.down
    # rename_column :addresses, :nation, :country
  end
end
