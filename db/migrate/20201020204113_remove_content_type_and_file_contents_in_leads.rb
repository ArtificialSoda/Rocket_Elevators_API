class RemoveContentTypeAndFileContentsInLeads < ActiveRecord::Migration[5.2]
  def up
    remove_column :leads, :content_type
    remove_column :leads, :file_contents
  end

  def down
    add_column :leads, :content_type, :string
    add_column :leads, :file_contents, :binary 
  end
end
