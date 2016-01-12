class Hostess < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :hall

  validates :lastname, presence: true
  validates :hall_id, presence: true
  validates :restaurant_id,	presence: true
  validates :lang, presence: true
end
