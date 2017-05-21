class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :product_description, :user_id
end
