class RestaurantCategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :restaurants

  def restaurants
    object.restaurants.map do |restaurant|
      RestaurantsSerializer.new(restaurant).as_json
    end
  end
end
