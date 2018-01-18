class OrdersController < ApplicationController
  before_action :get_product, only: [:create, :update]

  def create
    order = Order.create
  end


  private

  def get_product
    @product = Product.order(:id)
  end
end
