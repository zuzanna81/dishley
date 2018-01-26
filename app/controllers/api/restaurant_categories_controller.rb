class Api::RestaurantCategoriesController < ApiController

  def index
    restaurant_categories = RestaurantCategories.all
    render json: restaurant_categories
  end
end
