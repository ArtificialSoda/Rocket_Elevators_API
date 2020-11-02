ActiveAdmin.register BuildingDetail do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :building_id, :information_key, :value, :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:information_key, :value]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    column :building_id
    column :information_key
    column :value
    actions
  end

  filter :information_key


end
