class Cashier < ActiveRecord::Base
  belongs_to :restaurant
  has_many :bills
  
  validates :LASTNAME, 	      presence: true
  validates :restaurant_id, 	presence: true
end
