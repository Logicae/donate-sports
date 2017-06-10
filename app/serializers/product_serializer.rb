class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :product_description, :user_id, :sport_id

  belongs_to :sport
  belongs_to :user
end
