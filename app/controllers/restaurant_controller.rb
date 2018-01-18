class RestaurantController < ApplicationController
  before_action :coordinates, only: :index

  def index
    @restaurants = Restaurant.near([@coordinates[:latitude], @coordinates[:longitude]], 50)
    @restaurants = Restaurant.all
    @restaurant_categories = RestaurantCategory.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def coordinates
    if params[:lat].present? && params[:lng].present?
      @coordinates = {latitude: params[:lat],
                      longitude: params[:lng]}
      @geocoded = true
    else
      @coordinates = request.location.data.symbolize_keys
      # @geocoded = true
    end
  end
end
