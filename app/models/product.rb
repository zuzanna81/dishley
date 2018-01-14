class Product < ApplicationRecord
  validates :name, presence: true

  belongs_to :restaurant, foreign_key: true
end
