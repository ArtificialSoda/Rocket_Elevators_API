class Quote < ApplicationRecord
    has_many :admin_users
    has_many :customers, through: :admin_users 
end
