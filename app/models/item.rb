class Item < ActiveRecord::Base
  belongs_to :menu

  has_many :parts
  has_many :orders, through: :parts
end
