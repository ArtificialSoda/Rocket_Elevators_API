ActiveAdmin.register AdminUser, as:"User" do
  permit_params :email, :password, :password_confirmation, :admin_role

  index do
    selectable_column
    id_column
    column :email
    #column :encrypted_password
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin_role
    end
    f.actions
  end

end
