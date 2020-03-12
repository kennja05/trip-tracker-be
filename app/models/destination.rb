class Destination < ApplicationRecord

    has_many :trips
    has_many :users, through: :trips
    has_one :currency
    

end
