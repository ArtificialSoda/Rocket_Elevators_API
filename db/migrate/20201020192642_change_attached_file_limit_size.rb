class ChangeAttachedFileLimitSize < ActiveRecord::Migration[5.2]
  def up
    change_column :leads, :attached_file, :binary, :limit => 10.megabyte
  end
  def down
    change_column :leads, :attached_file, :binary
  end
end
