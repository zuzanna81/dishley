class Product < ApplicationRecord
  validates :name, :description, presence: true


  belongs_to :restaurant
end
