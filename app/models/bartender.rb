class Bartender < ApplicationRecord
  belongs_to :bar
  has_many :orders
  has_many :users, through: :orders
end
