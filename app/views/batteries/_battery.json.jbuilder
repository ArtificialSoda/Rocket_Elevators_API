json.extract! battery, :id, :building_id, :type, :status, :employee_id, :commissioning_date, :last_inspection_date, :operations_certificate, :information, :notes, :created_at, :updated_at
json.url battery_url(battery, format: :json)
