class Restaurants::ShowSerializer < RestaurantSerializer
  attributes :id, :name, :menus, :description, :city, :post_code, :street_address
  belongs_to :restaurant
  has_many :menus
end
