class Item < ActiveRecord::Base
  belongs_to :menu
  belongs_to :restaurant

  has_many :parts
  has_many :orders, through: :parts
end
