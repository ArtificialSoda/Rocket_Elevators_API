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

    def how_many_columns
     how_many = 0
     self.batteries.each do |battery|
        how_many = how_many + battery.columns.size
     end
     how_many
    end

    def how_many_elevators
        how_many = 0
            self.batteries.each do |battery|
                battery.columns.each do |column|
                    how_many = how_many + column.elevators.size
                end
            end
        how_many
    end

    def how_many_floors
        how_many = 0 
        self.batteries.each do |battery|
            battery.columns.each do |column|
                how_many = how_many + column.number_of_floors_served.size
            end
        end
        how_many
    end
end
