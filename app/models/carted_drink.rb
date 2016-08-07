class CartedDrink < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :drink
end
