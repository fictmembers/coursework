class Order < ActiveRecord::Base
    belongs_to :bill
    belongs_to :customer
    belongs_to :waiter
    belongs_to :administrator
    belongs_to :chef
    has_many :parts
    has_many :items, through: :parts
end
