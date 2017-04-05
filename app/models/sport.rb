class Sport < ApplicationRecord
    has_many :products
    has_many :users, through: :products
    accepts_nested_attributes_for :products

    def products_attributes=(product_attributes)
        product_attributes.each do |k, product_attribute|
            if product_attribute[:product_name].present? && product_attribute[:product_description].present? 
                product = Product.create(product_attribute)
                self.products << product
            end
        end
    end
end



