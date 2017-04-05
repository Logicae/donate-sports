class Product < ApplicationRecord
    belongs_to :sport, optional: true
    belongs_to :user, optional: true
end
