class AddColumnToBattery < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :columns, foreign_key: true
  end
end
