class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bartender, optional: true
  has_many :carted_drinks
  has_many :drinks, through: :carted_drinks

def subtotal
  @carted_drinks = CartedDrink.where(status: "purchased", order_id: id)
  order_subtotal = 0
  @carted_drinks.each do |carted_drink|
    order_subtotal = (order_subtotal + carted_drink.drink.price) * carted_drink.quantity
  end
  return order_subtotal
end

def tip
  subtotal * 0.2
end

def tax
  subtotal * 0.1
end

def total
  total = subtotal + tip + tax
end

end
