class User < ApplicationRecord

has_secure_password

has_many :trips
has_many :destinations, through: :trips
validates :username, uniqueness: true
validates :phone, presence: true, length: { is: 10 }


end
