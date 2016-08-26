class OrdersController < ApplicationController
    before_action :authenticate_user!
  def create
    carteddrinks = CartedDrink.where(status: "carted", user_id: current_user.id)
    @order = Order.new(
      user_id: current_user.id
    )
    @order.save
    carteddrinks.each do |carteddrink|
      carteddrink.update(order_id: @order.id)
      carteddrink.update(status: "purchased")
    end
    @order.subtotal
    @order.tax 
    @order.tip 
    @order.total
    @order.save

    flash[:success] = "Order created!"
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    @purchases = CartedDrink.where(status: "purchased", user_id: current_user.id, order_id: @order.id)
    render 'show.html.erb'
  end

  def status
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    @purchases = CartedDrink.where(status: "making", user_id: current_user.id, order_id: @order.id)
    render 'status.html.erb'
  end
end
