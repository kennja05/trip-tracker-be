class Destination < ApplicationRecord

    has_many :trips
    has_many :users, through: :trips
    before_save :default_symbol, :default_capital

    def default_symbol
        if !self.symbol
            self.symbol = '$'
        end 
    end

    def default_capital
        if !self.capital || self.capital === ""
            self.capital = "N/A"
        end
    end 

end