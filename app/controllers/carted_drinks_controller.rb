class CartedDrinksController < ApplicationController
  before_action :authenticate_user!
  def index
    @section = 165
    @carteddrinks = CartedDrink.all.where(status: "carted")
    render 'index.html.erb'
  end

  def create
    @drink = Drink.find_by(id: params[:drink_id])
    @carteddrink = CartedDrink.new(
      user_id: current_user.id,
      drink_id: params[:drink_id],
      quantity: params[:quantity],
      status: "carted"
    )
    @carteddrink.save
    redirect_to "/carted_drinks"
  end

  def destroy
    @carteddrink = CartedDrink.find_by(id: params[:id])
    @carteddrink.update(status: "removed")
    redirect_to "/carted_drinks"
  end
end
