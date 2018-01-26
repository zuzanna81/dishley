class Restaurants::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :restaurant_category

  def restaurant_category
    RestaurantCategorySerializer.new(object.restaurant_category).as_json
  end
end
