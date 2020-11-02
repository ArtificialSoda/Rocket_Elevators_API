ActiveAdmin.register Elevator do
  permit_params :column_id, :serial_number, :model, :type, :status, :commissioning_date, :last_inspection_date, :inspection_certificate, :information, :notes, :customer_id

  index do
    selectable_column
    column :column_id
    #column :serial_number
    column :model
    #column :type
    column :status
    #column :commissioning_date
    column :last_inspection_date
    column :inspection_certificate
    column :information
    column :notes
    actions
  end

  filter :column_id
  filter :serial_number
  filter :model
  #filter :type
  filter :status
  filter :commissioning_date
  filter :last_inspection_date
  filter :inspection_certificate
  #filter :information
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :column_id, :serial_number, :model, :type, :status, :commissioning_date, :last_inspection_date, :inspection_certificate, :information, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:column_id, :serial_number, :model, :type, :status, :commissioning_date, :last_inspection_date, :inspection_certificate, :information, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
