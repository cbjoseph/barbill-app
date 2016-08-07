class Drink < ApplicationRecord
  belongs_to :bar
  belongs_to :category
  has_many :ratings
  has_many :carted_drinks
end
