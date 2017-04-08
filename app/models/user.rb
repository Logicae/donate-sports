class User < ApplicationRecord
    has_many :products
    has_many :sports, through: :products

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true

    has_secure_password

    def self.create_with_omniauth(auth)
        @user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
        @user.name = auth[:info][:nickname]
        @user.email = auth[:info][:urls][:GitHub]
        @user.password = auth[:credentials][:token]
        @user.save
        @user
    end

end
