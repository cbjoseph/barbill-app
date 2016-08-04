class CartedDrink < ApplicationRecord
  belongs_to :order
  belongs_to :user
  belongs_to :drink
end
