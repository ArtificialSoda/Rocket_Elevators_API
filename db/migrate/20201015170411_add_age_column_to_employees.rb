class AddAgeColumnToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :age, :tinyint
  end
end
