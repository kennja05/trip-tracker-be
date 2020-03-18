class PlannedExpense < ApplicationRecord
    belongs_to :trip

    validates :cost, numericality: { greater_than: 0}
end
