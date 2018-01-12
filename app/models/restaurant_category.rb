class RestaurantCategory < ApplicationRecord
  validates :name, presence: true

  has_many :restaurants
end
