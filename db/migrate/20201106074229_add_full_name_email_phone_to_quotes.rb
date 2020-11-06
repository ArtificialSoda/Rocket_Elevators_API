class AddFullNameEmailPhoneToQuotes < ActiveRecord::Migration[5.2]
  def up
    add_column :quotes, :full_name, :string
    add_column :quotes, :email, :string
    add_column :quotes, :phone, :string
  end
  def down
    remove_column :quotes, :full_name
    remove_column :quotes, :email
    remove_column :quotes, :phone
  end
end
