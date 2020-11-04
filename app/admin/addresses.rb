ActiveAdmin.register Address do
  permit_params :type_of_address, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes, :latitude, :longitude

  index do
    selectable_column
    #column :type_of_address
    #column :status
    #column :entity
    column :number_and_street
    column :suite_or_apartment
    column :city
    column :postal_code
    column :country
    #column :notes
    actions
  end

  #filter :type_of_address
  filter :status
  #filter :entity
  filter :number_and_street
  filter :suite_or_apartment
  filter :city
  filter :postal_code
  filter :country


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :type_of_address, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:type_of_address, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
