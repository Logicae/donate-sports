class Product < ApplicationRecord
    belongs_to :sport, optional: true
    belongs_to :user, optional: true

    # validates :product_name, presence: true
    # validates :product_description, presence: true
end
