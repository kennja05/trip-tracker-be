class User < ApplicationRecord

    has_secure_password

    has_many :trips
    has_many :destinations, through: :trips
    validates :username, uniqueness: { case_sensitive: false }, length: {minimum: 5} 
    

end
