class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :product_description
end
