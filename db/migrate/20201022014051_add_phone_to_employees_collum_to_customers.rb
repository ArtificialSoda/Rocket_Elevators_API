class AddPhoneToEmployeesCollumToCustomers < ActiveRecord::Migration[5.2]
  def change


    add_column :employees, :phone_number, :string

    #add_column :customers, :full_name_service_technical_authority, :string
    #add_column :customers, :technical_authority_phone, :string
    #add_column :customers, :technical_manager_email, :string

    add_reference :customers, :employee

  end
end
