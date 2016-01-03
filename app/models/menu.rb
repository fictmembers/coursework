class Menu < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :restaurant
  validates :cuisine, presence: true
  validates :restaurant_id, presence: true
end
