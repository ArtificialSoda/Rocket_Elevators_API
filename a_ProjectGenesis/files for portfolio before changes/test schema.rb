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

<<<<<<< vietnga
ActiveRecord::Schema.define(version: 2020_10_19_205938) do

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
    t.string "nation"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
=======
ActiveRecord::Schema.define(version: 2020_10_19_230343) do
>>>>>>> trevor

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_role", default: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

<<<<<<< vietnga
  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "building_id"
    t.string "type"
    t.string "status"
    t.string "employee_id"
    t.date "commissioning_date"
    t.date "last_inspection_date"
    t.string "operations_certificate"
    t.string "information"
    t.string "notes"
=======
  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "information_key"
    t.string "value"
>>>>>>> trevor
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< vietnga
  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
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
=======
  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address_of_the_building"
    t.string "full_name_of_the_building_administrator"
    t.string "email_of_the_administrator_of_the_building"
    t.string "phone_number_of_the_building_administrator"
    t.string "full_name_of_the_technical_contact_for_the_building"
    t.string "technical_contact_email_for_the_building"
    t.string "technical_contact_phone_for_the_building"
>>>>>>> trevor
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< vietnga
  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "column_id"
    t.string "serial_number"
    t.string "model"
    t.string "type"
    t.string "status"
    t.date "commissioning_date"
    t.date "last_inspection_date"
    t.string "inspection_certificate"
    t.string "information"
    t.string "notes"
=======
  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_of_building"
    t.integer "number_of_floors_served"
    t.string "status"
    t.string "information"
    t.text "notes"
>>>>>>> trevor
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "updated_at", null: false
    t.integer "no_of_elevators"
    t.string "product_grade"
    t.float "elevator_cost"
    t.float "installation_cost"
    t.float "total_cost"
    t.integer "no_of_daily_hours_of_activity"
  end

end
