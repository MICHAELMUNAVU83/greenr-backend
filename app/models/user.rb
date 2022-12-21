class User < ApplicationRecord
    has_secure_password
    has_many :carbon_credits
    has_many :transactions
    validates :email, uniqueness: true

end
