class Trip < ApplicationRecord

    belongs_to :user
    belongs_to :destination
    has_many :values, through: :destination
    has_many :planned_expenses, dependent: :destroy

end
