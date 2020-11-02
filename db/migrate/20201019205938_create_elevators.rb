class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :column_id
      t.string :serial_number
      t.string :model
      t.string :type
      t.string :status
      t.date :commissioning_date
      t.date :last_inspection_date
      t.string :inspection_certificate
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
