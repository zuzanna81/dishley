class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product])
    order = Order.create
    order.add(product, product.price)
  end
end
