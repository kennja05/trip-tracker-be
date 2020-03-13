class Value < ApplicationRecord

    has_many :currencies
    has_many :destinations, through: :currencies 

end
