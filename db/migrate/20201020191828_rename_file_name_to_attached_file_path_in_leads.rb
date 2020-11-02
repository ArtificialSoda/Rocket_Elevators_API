class RenameFileNameToAttachedFilePathInLeads < ActiveRecord::Migration[5.2]
  def up
    rename_column :leads, :filename, :attached_file_path
  end
  def down
    rename_column :leads, :attached_file_path, :filename
  end
end
