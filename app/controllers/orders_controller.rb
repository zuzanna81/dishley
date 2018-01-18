class OrdersController < ApplicationController

  def create
    order = Order.create
    @product = Product.find(params[:product_id])
    order.add(@product, @product.price)
    if order.persisted?
      session[:order_id] = order.id
      redirect_back_with_notice
    end
  end

  private

  def redirect_back_with_notice
    redirect_back(fallback_location: root_path, notice: "#{@product.name} has been added to your order")
  end
end
