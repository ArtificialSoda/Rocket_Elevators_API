class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :contact_full_name
      t.string :company_name
      t.string :email
      t.integer :phone
      t.string :project_name
      t.text :project_description
      t.string :department
      t.text :message
      t.binary :attached_file
      t.datetime :created_at

      t.timestamps
    end
  end
end
