class Destination < ApplicationRecord

    has_many :trips
    has_many :users, through: :trips
    belongs_to :currency
    before_save :default_symbol

    def default_symbol
        if !self.symbol
            self.symbol = '$'
        end 
    end

end
