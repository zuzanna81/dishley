class Restaurants::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :restaurant_category

end


# belongs_to :restaurant_category, only: [name]
# has_many :menus
# has_many :product_categories
# has_many :products
