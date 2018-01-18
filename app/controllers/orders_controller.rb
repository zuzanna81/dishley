class OrdersController < ApplicationController
  # before_action :get_product, only: [:create, :update]

  def create
    binding.pry
    order = Order.create
    product = Product.find(params[:product_id])
    order.add(product, product.price)
    # if order.persisted?
    #   session[:order_id] = order.id
  end


  private
  #
  # def get_product
  #   binding.pry
  #   @product = Product.find(:id)
  # end
end
