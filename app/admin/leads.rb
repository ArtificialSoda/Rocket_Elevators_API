ActiveAdmin.register Lead do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  permit_params :contact_full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message

  index do
    selectable_column
    #id_column
    column :created_at
    column :contact_full_name
    column :company_name
    column :email
    column :phone
    column :project_name
    column :department
    actions
  end

  filter :contact_full_name
  filter :company_name
  filter :email
  filter :project_name
  filter :department
end
