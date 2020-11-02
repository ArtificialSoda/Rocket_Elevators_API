class Battery < ApplicationRecord
    belongs_to :building
    belongs_to :employee
    has_many :columns
    def display_name
        "#{id}"
    end
    belongs_to :customer
    
end
