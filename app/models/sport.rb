class Sport < ApplicationRecord
    has_many :products
    has_many :users, through: :products

    def products_attributes=(product_attributes)
        binding.pry
        product_attributes.each do |k, product_attribute|
            if product_attribute[:product_name].present? && product_attribute[:product_description].present? 
                product = Product.create(product_attribute)
                self.products << product
            end
        end
    end
end
