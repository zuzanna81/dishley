class RestaurantController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurant_categories = RestaurantCategory.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
