class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many(:drinks, {through: :ratings})
  has_many :bartenders, through: :orders
end
