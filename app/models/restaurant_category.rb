class RestaurantCategory < ApplicationRecord
  validates :name, presence: true
end
