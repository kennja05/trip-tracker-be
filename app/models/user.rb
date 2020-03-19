class User < ApplicationRecord

has_many :trips
has_many :destinations, through: :trips
# has_many :follows
# has_many :currencies, through: :followes
validates :name, presence: true
validates :username, uniqueness: true
validates :password, presence: true
validates :email, presence: true
validates :phone, presence: true, length: { is: 10 }


end
