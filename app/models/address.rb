class Address < ApplicationRecord
    has_many :customers
    def display_name
       "#{entity} #{number_and_street} #{suite_or_apartment} #{city} #{postal_code} #{country} " 
    end
    has_many :buildings
    def display_name
        "#{entity} #{number_and_street} #{suite_or_apartment} #{city} #{postal_code} #{country} " 
    end
 
end
