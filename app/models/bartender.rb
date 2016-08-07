class Bartender < ApplicationRecord
  has_secure_password
  belongs_to :bar
  has_many :orders
  has_many :users, through: :orders
end
