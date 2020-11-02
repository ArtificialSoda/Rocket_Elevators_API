ActiveAdmin.register Battery do
  permit_params :building_id, :type_of_building, :status, :employee_id, :commissioning_date, :last_inspection_date, :operations_certificate, :information, :notes, :customer_id

  index do
    selectable_column
    id_column
    column :building_id
    #column :type_of_building
    column :status
    #column :employee_id
    #column :commissioning_date
    column :last_inspection_date
    #column :operations_certificate
    #column :information
    #column :notes
    actions
  end

  filter :building_id
  filter :type_of_building
  filter :status
  filter :employee_id
  #filter :commissioning_date
  filter :last_inspection_date
  #filter :operations_certificate
  #filter :information
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :building_id, :type_of_building, :status, :employee_id, :commissioning_date, :last_inspection_date, :operations_certificate, :information, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:building_id, :type_of_building, :status, :employee_id, :commissioning_date, :last_inspection_date, :operations_certificate, :information, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
