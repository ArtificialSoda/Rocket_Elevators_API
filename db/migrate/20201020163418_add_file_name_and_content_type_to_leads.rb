class AddFileNameAndContentTypeToLeads < ActiveRecord::Migration[5.2]
  def up
    add_column :leads, :filename, :string
    add_column :leads, :content_type, :string
    add_column :leads, :file_contents, :binary 
  end

  def down
    remove_column :leads, :filename
    remove_column :leads, :content_type
    remove_column :leads, :file_contents
  end

end
