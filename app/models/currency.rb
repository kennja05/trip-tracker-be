class Currency < ApplicationRecord

    belongs_to :destination
    belongs_to :value

end
