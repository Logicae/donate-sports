class SportSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :products
  has_many :users, through: :products
end
