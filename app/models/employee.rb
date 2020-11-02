class Employee < ApplicationRecord
    has_many :batteries
    def display_name
        "#{first_name} #{last_name}"
    end
    belongs_to :admin_user

    has_many :customers
    def to_s
        "#{ID}"
    end
end
