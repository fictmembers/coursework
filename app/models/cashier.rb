class Cashier < ActiveRecord::Base
  belongs_to :restaurant
  has_many :bills

  validates :lastname, presence: true
  validates :restaurant_id,	presence: true
  validates :lang, presence: true
end
