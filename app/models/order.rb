class Order < ActiveRecord::Base

    belongs_to :restaurant
    belongs_to :customer
    belongs_to :waiter
    belongs_to :manager
    belongs_to :chef
    has_one :bill
    has_many :parts
    has_many :items, through: :parts
end
