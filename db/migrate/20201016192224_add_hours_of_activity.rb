class AddHoursOfActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :no_of_daily_hours_of_activity, :int
    rename_column :quotes, :num_elevators, :no_of_elevators
  end
end
