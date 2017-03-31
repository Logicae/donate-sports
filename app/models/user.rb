class User < ApplicationRecord
    has_many :products
    has_many :sports, through: :products

    has_secure_password
end
