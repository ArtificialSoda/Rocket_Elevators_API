class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :building_id
      t.string :type
      t.string :status
      t.string :employee_id
      t.date :commissioning_date
      t.date :last_inspection_date
      t.string :operations_certificate
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
