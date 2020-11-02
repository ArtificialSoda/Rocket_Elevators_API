ActiveAdmin.register Column do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :battery_id, :type_of_building, :number_of_floors_served, :status, :information, :notes, :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:type, :number_of_floors_served, :status, :information, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :battery_id
    #column :type_of_building
    #column :number_of_floors_served
    column :status
    #column :information
    #column :notes
    actions
  end
  filter :status
  filter :battery_id
  filter :type_of_building
  
end
