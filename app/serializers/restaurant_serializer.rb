class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city, :post_code, :street_address
  belongs_to :restaurant_category
  has_many :products
  has_many :menus

end
