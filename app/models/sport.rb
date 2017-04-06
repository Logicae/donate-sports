class Sport < ApplicationRecord
   
    has_many :products
    has_many :users, through: :products

    validates :name, presence: true

    accepts_nested_attributes_for :products

    def products_attributes=(product_attributes)
        product_attributes.each do |k, product_attribute|
            product = Product.create(product_attribute)
            self.products << product
        end
    end
    
    def self.sort_by_sport
        Sport.group(:name).order('count_id DESC').limit(5).count(:id)
    end 
    
end



