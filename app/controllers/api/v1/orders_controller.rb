class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    render 'show.json.jbuilder'
  end
end
