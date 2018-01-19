class RestaurantController < ApplicationController
  before_action :coordinates, only: :index

  def index
    binding.pry
    @restaurants = Restaurant.near([@coordinates[:latitude], @coordinates[:longitude]], 100).group_by(&:category_name) if @coordinates
    # @restaurant_categories = RestaurantCategory.all
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
      @geocoded = false
    end
  end
end
