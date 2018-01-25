class Api::RestaurantsController < ApplicationController

  def index
    restaurants = Restaurant.all
    render json: restaurants, each_serializer: Restaurants::IndexSerializer
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant, serializer: Restaurants::ShowSerializer
  end
end
