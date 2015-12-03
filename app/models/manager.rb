class Manager < ActiveRecord::Base

  belongs_to :restaurant
  has_many :orders

  validates :lastname, 	presence: true
  validates :tel,       presence: true, length: { minimum: 6 }
  validates :restaurant_id, 	presence: true

end
