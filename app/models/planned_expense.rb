class PlannedExpense < ApplicationRecord
    belongs_to :trip

    validates :cost, numericality: { greater_than: 0}
    before_save :defaultName

    def defaultName
        if self.name === ""
            self.name = self.category
        end
    end 

end