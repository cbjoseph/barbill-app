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
    @section = 165
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    @purchases = CartedDrink.where(status: "purchased", user_id: current_user.id, order_id: @order.id)
    @carteddrinks = CartedDrink.all
    @purchases.each do |purchase|
      ActionCable.server.broadcast 'bartender_channel', {
      id: purchase.id
    }
  end
    render 'show.html.erb'
  end

  def pictures
    #     @pictures = [Unirest.post(
    #   "https://api.ocr.space/parse/image",
    #   parameters: {
    #     :apikey => ENV['API_KEY'], 
    #     :file => params[:imageData],
    #     :language => "eng",
    #     isOverlayRequired: false
    #   }
    # ).body]
    # render 'pictures.html.erb'
    data = Unirest.post(
      "https://api.ocr.space/parse/image",
      parameters: {
        :apikey => ENV['API_KEY'], 
        :file => params[:imageData],
        :language => "eng",
        isOverlayRequired: false
      }
    ).body


    render json: {data: data, test: "hello", success: true}
  end
end
