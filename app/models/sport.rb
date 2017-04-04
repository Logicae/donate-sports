class Sport < ApplicationRecord
    has_many :products
    has_many :users, through: :products
    accepts_nested_attributes_for :products

    def products_attributes=(product_attributes)
        binding.pry
        product_attributes.each do |k, product_attribute|
            if product_attribute[:product_name].present? && product_attribute[:product_description].present? 
                self.products.create(product_name: product_attribute[:product_name], product_description: product_attribute[:product_description], user_id: user_id)
            end
        end
    end
end



