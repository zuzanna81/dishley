class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city, :post_code, :street_address, :restaurant_category
end
