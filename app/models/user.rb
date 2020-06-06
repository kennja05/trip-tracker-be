class User < ApplicationRecord

has_secure_password

has_many :trips
has_many :destinations, through: :trips
validates :name, presence: true
validates :username, uniqueness: true
validates :password, presence: true
validates :email, presence: true
validates :phone, presence: true, length: { is: 10 }


end
