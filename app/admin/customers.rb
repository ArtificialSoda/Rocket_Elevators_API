ActiveAdmin.register Customer do
  permit_params :employee_id, :admin_user_id, :address_id, :customer_creation_date, :company_name, :company_headquarter_address, :full_name_company_contact, :company_contact_phone, :email_company_contact, :company_description, :full_name_service_technical_authority, :technical_authority_phone, :technical_manager_email

  index do
    selectable_column
    id_column
    column :admin_user_id, as:"User"
    #column :address_id
    column :customer_creation_date
    column :company_name
    column :company_headquarter_address
    column :full_name_company_contact
    column :company_contact_phone
    column :email_company_contact
    #column :company_description
    #column :full_name_service_technical_authority
    column :technical_authority_phone
    #column :technical_manager_email
    actions
  end

  #filter :admin_user_id
  #filter :customer_creation_date
  filter :company_name
  filter :company_headquarter_address
  filter :full_name_company_contact
  filter :company_contact_phone
  filter :email_company_contact
  filter :full_name_service_technical_authority
  #filter :technical_authority_phone
  #filter :technical_manager_email

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :customer_creation_date, :company_name, :company_headquarter_address, :full_name_company_contact, :company_contact_phone, :email_company_contact, :company_description, :full_name_service_technical_authority, :technical_authority_phone, :technical_manager_email
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :customer_creation_date, :company_name, :company_headquarter_address, :full_name_company_contact, :company_contact_phone, :email_company_contact, :company_description, :full_name_service_technical_authority, :technical_authority_phone, :technical_manager_email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
