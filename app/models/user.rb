class User < ApplicationRecord
    has_many :products
    has_many :sports, through: :products

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true

    has_secure_password

    def self.create_with_omniauth(auth)
        user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’])
        user.email = “#{auth[‘uid’]}@#{auth[‘provider’]}.com”
        user.password = auth[‘uid’]
        user.name = auth[‘info’][‘name’]
        if User.exists?(user)
            user
        else
            user.save!
            user
        end
    end

end
