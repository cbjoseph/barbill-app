class QueuedDrinksController < ApplicationController
layout 'bartenderhomepage.html.erb'
  def index
    @carteddrinks = CartedDrink.find_by_bar_id(current_bartender.bar_id)
  end

  def edit
    @carteddrink = CartedDrink.find_by(id: params[:id])
    @carteddrink.update(
      id: params[:id],
      status: "making"
      )
     ActionCable.server.broadcast 'activity_channel', {
      id: @carteddrink.id,
      order_id: @carteddrink.order_id,
      status: @carteddrink.status
    }
    render 'edit.html.erb'
  end

  def update
    @carteddrink = CartedDrink.find_by(id: params[:id])
    @carteddrink.update(
      id: params[:id],
      status: "completed"
    )
    @order = Order.find_by(id: @carteddrink.order_id)
    @order.update(
      bartender_id: current_bartender.id
    )
    ActionCable.server.broadcast 'activity_channel', {
      id: @carteddrink.id,
      order_id: @carteddrink.order_id,
      status: @carteddrink.status
    }

    should_i_send_a_text = true
    puts "*" * 30
    CartedDrink.find_by_bar_id(current_bartender.bar_id).each do |carteddrink|
      p carteddrink.status
      unless carteddrink.status == "completed"
        should_i_send_a_text = false
        break
      end
    end
    if should_i_send_a_text
      @order.sendtext
    end
    puts "*" * 30

    redirect_to '/queue'
  end
end
