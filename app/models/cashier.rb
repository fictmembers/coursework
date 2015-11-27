class Cashier < ActiveRecord::Base
  belongs_to :restaurant
  has_many :bills
end
