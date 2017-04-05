class User < ApplicationRecord
    has_many :products
    has_many :sports, through: :products

    # validates :name, presence: true
    # validates :email, presence: true
    # validates :password, presence: true

    has_secure_password
end
