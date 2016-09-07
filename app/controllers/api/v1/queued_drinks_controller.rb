class Api::V1::QueuedDrinksController < ApplicationController
  before_action :authenticate_bartender!
  def index
     @carteddrinks = CartedDrink.find_by_bar_id(current_bartender.bar_id)
     render 'index.json.jbuilder'
  end
end
