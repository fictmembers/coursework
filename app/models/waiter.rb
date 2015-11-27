class Waiter < ActiveRecord::Base
    belongs_to :restaurant
    has_many :tables
    has_many :orders
end
