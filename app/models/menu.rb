class Menu < ActiveRecord::Base
  has_many :items
  belongs_to :restaurant
  validates :cuisine, presence: true
  validates :restaurant_id, presence: true
end
