class User < ApplicationRecord

has_many :trips
has_many :destinations, through: :trips
# has_many :follows
# has_many :currencies, through: :followes

end
