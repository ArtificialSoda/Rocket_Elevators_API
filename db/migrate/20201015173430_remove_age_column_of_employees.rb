class RemoveAgeColumnOfEmployees < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :age, :tinyint
  end
end
