ActiveAdmin.register Building do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :customer_id, :address_id, :address_of_the_building, :full_name_of_the_building_administrator, :email_of_the_administrator_of_the_building, :phone_number_of_the_building_administrator, :full_name_of_the_technical_contact_for_the_building, :technical_contact_email_for_the_building, :technical_contact_phone_for_the_building
  #
  # or
  #
  # permit_params do
  #   permitted = [:address_of_the_building, :full_name_of_the_building_administrator, :email_of_the_administrator_of_the_building, :phone_number_of_the_building_administrator, :full_name_of_the_technical_contact_for_the_building, :technical_contact_email_for_the_building, :technical_contact_phone_for_the_building]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    #column :address_id
    column :address_of_the_building
    column :full_name_of_the_building_administrator
    #column :email_of_the_administrator_of_the_building
    #column :phone_number_of_the_building_administrator
    column :full_name_of_the_technical_contact_for_the_building
    #column :technical_contact_email_for_the_building
    #column :technical_contact_phone_for_the_building
    actions
  end

  filter :address_of_the_building
  filter :full_name_of_the_building_administrator
  filter :full_name_of_the_technical_contact_for_the_building
  filter :customer_id

end
