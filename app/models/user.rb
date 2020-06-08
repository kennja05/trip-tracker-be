class User < ApplicationRecord

    has_secure_password
    has_secure_password :password_confirmation, validations: false    

    has_many :trips
    has_many :destinations, through: :trips
    validates :username, uniqueness: { case_sensitive: false }
    validates :phone, presence: true, length: { is: 10 }

    # def password_must_be_strong
    #     if password_digest.length < 3
    #         errors.add(:password_digest, 'Password must be longer than 3 characters')
    #     end
    # end

end
