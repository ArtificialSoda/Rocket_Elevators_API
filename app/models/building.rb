class Building < ApplicationRecord
    has_many :batteries
    def to_s
        "#{address_of_the_building}"
    end

    belongs_to :customer
    has_one :building_detail
    def to_s
        "#{address_of_the_building}"
    end
    belongs_to :address
   

end
