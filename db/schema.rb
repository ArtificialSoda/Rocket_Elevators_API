# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_06_180143) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_of_address"
    t.string "status"
    t.string "entity"
    t.string "number_and_street"
    t.string "suite_or_apartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude", limit: 53
    t.float "longitude", limit: 53
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "building_id"
    t.string "type_of_building"
    t.string "status"
    t.string "employee_id"
    t.date "commissioning_date"
    t.date "last_inspection_date"
    t.string "operations_certificate"
    t.string "information"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "buildings_id"
    t.bigint "employees_id"
    t.index ["buildings_id"], name: "index_batteries_on_buildings_id"
    t.index ["customer_id"], name: "index_batteries_on_customer_id"
    t.index ["employees_id"], name: "index_batteries_on_employees_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "information_key"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.bigint "customer_id"
    t.bigint "buildings_id"
    t.index ["building_id"], name: "index_building_details_on_building_id"
    t.index ["buildings_id"], name: "index_building_details_on_buildings_id"
    t.index ["customer_id"], name: "index_building_details_on_customer_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address_of_the_building"
    t.string "full_name_of_the_building_administrator"
    t.string "email_of_the_administrator_of_the_building"
    t.string "phone_number_of_the_building_administrator"
    t.string "full_name_of_the_technical_contact_for_the_building"
    t.string "technical_contact_email_for_the_building"
    t.string "technical_contact_phone_for_the_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "address_id"
    t.bigint "addresses_id"
    t.bigint "customers_id"
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["addresses_id"], name: "index_buildings_on_addresses_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
    t.index ["customers_id"], name: "index_buildings_on_customers_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_of_building"
    t.integer "number_of_floors_served"
    t.string "status"
    t.string "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "battery_id"
    t.bigint "customer_id"
    t.bigint "batteries_id"
    t.index ["batteries_id"], name: "index_columns_on_batteries_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
    t.index ["customer_id"], name: "index_columns_on_customer_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "customer_creation_date"
    t.string "company_name"
    t.string "company_headquarter_address"
    t.string "full_name_company_contact"
    t.string "company_contact_phone"
    t.string "email_company_contact"
    t.string "company_description"
    t.string "full_name_service_technical_authority"
    t.string "technical_authority_phone"
    t.string "technical_manager_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_user_id"
    t.bigint "address_id"
    t.bigint "employee_id"
    t.bigint "addresses_id"
    t.bigint "users_id"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["addresses_id"], name: "index_customers_on_addresses_id"
    t.index ["admin_user_id"], name: "index_customers_on_admin_user_id"
    t.index ["employee_id"], name: "index_customers_on_employee_id"
    t.index ["users_id"], name: "index_customers_on_users_id"
  end

  create_table "dimcustomers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "creation_date"
    t.string "company_name"
    t.string "full_name_of_company_main_contact"
    t.string "email_of_company_main_contact"
    t.integer "nb_elevator"
    t.string "contact_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "serial_number"
    t.string "model"
    t.string "type_of_building"
    t.string "status"
    t.date "commissioning_date"
    t.date "last_inspection_date"
    t.string "inspection_certificate"
    t.string "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "column_id"
    t.bigint "customer_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
    t.index ["customer_id"], name: "index_elevators_on_customer_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_user_id"
    t.string "phone_number"
    t.index ["admin_user_id"], name: "index_employees_on_admin_user_id"
  end

  create_table "factcontact", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "creation_date"
    t.string "company_name"
    t.string "email"
    t.integer "project_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factelevator", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "serial_number"
    t.string "date_of_commissioning"
    t.string "building_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factquote", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "creation"
    t.string "company_name"
    t.string "email"
    t.integer "nb_elevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "contact_full_name"
    t.string "company_name"
    t.string "email"
    t.string "phone"
    t.string "project_name"
    t.text "project_description"
    t.string "department"
    t.text "message"
    t.binary "attached_file", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attached_file_path"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_leads_on_customer_id"
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "building_type"
    t.integer "no_of_appartments"
    t.integer "no_of_floors"
    t.integer "no_of_basements"
    t.integer "no_of_elevators_cages"
    t.integer "no_of_parking_spaces"
    t.integer "no_of_tenant_companies"
    t.integer "no_of_distinct_businesses"
    t.integer "max_occupants_per_floors"
    t.datetime "created_at", null: false
    t.integer "no_of_elevators"
    t.string "product_grade"
    t.string "elevator_cost"
    t.string "installation_cost"
    t.string "total_cost"
    t.integer "no_of_daily_hours_of_activity"
    t.bigint "customer_id"
    t.string "company_name"
    t.string "contact_email"
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.index ["customer_id"], name: "index_quotes_on_customer_id"
  end

  add_foreign_key "batteries", "buildings", column: "buildings_id"
  add_foreign_key "batteries", "employees", column: "employees_id"
  add_foreign_key "building_details", "buildings", column: "buildings_id"
  add_foreign_key "buildings", "addresses", column: "addresses_id"
  add_foreign_key "buildings", "customers", column: "customers_id"
  add_foreign_key "columns", "batteries", column: "batteries_id"
  add_foreign_key "customers", "addresses", column: "addresses_id"
end
