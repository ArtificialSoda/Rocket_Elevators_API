class Lead < ApplicationRecord
    has_one_attached :attachment
    belongs_to :customer, :optional => true
end

