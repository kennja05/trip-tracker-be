class User < ApplicationRecord

    has_secure_password

    has_many :trips
    has_many :destinations, through: :trips
    validates :username, uniqueness: { case_sensitive: false }, length: {minimum: 5} 
    # validate :password_must_be_strong
    

    # def password_must_be_strong
    #     if password_digest.length < 3
    #         errors.add(:password, 'must be longer than 3 characters')
    #     end
    # end

end
