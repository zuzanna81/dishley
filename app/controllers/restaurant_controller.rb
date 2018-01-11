class RestaurantController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  # def create
  #   @restaurant = Restaurant.create
  # end
end
