class Api::V1::CartedDrinksController < ApplicationController
    before_action :authenticate_user!

def index
  @carteddrinks = CartedDrink.all
end

end
