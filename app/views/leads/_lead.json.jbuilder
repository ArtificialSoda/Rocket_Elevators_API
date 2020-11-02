json.extract! lead, :id, :contact_full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message, :attached_file, :created_at, :created_at, :updated_at
json.url lead_url(lead, format: :json)
