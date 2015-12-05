class Order < ActiveRecord::Base
    has_one :bill
    belongs_to :customer
    belongs_to :waiter
    belongs_to :manager
    belongs_to :chef
    has_many :parts
    has_many :items, through: :parts
end
