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
        hash = Product.group(:sport_id).order('count_id DESC').limit(6).count(:id)
        most_prevalent_key = hash.key(hash.values.max)
        most_prevalent = Sport.find_by(id: most_prevalent_key)
        most_prevalent.name
    end 
    
end



