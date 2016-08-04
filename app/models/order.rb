class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bartender
  has_many :carted_drinks
  has_many :drinks, through: :carted_drinks
end
