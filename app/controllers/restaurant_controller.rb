class RestaurantController < ApplicationController
  before_action :coordinates, only: :index

  def index
    @restaurants = Restaurant.near([@coordinates[:latitude], @coordinates[:longitude]], 50)
    @restaurant_categories = RestaurantCategory.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def coordinates
    @coordinates = {}
    if cookies['geocoderLocation'].present?
      @coordinates = JSON.parse(cookies['geocoderLocation']).to_hash.symbolize_keys
      @geocoded = true
    else
    binding.pry
      @geocoded = false
    end
  end
end
