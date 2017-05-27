class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  has_many :products
  has_many :sports, through: :products
end
