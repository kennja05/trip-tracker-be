class Currency < ApplicationRecord

    has_many :destinations
    has_many :values

end
