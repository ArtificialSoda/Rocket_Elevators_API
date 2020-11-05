class Column < ApplicationRecord
    belongs_to :battery
    has_many :elevators
    def display_name
        "#{id}"
    end
    belongs_to :customer   
    
end
