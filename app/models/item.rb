class Item < ActiveRecord::Base
  has_many :parts
  has_many :orders, through: :parts
end
