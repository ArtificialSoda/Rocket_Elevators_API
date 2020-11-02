class BuildingDetail < ApplicationRecord
    belongs_to :building
    belongs_to :customer
end
