class CartedDrink < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :drink

  def self.find_by_bar_id(bar_id)
    carted_drinks = []
    CartedDrink.where(status: 'purchased').each do |carted_drink|
      carted_drinks << carted_drink if carted_drink.drink.bar_id == bar_id
    end
    carted_drinks
  end
end
