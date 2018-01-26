class Api::RestaurantCategoriesController < ApiController

  def index
    restaurant_categories = RestaurantCategory.all
    render json: restaurant_categories
  end
end
