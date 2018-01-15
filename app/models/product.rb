class Product < ApplicationRecord
  validates :name, presence: true
  belongs_to :product_category
  belongs_to :restaurant
end
