class Bill < ActiveRecord::Base
    belongs_to :cashier
    belongs_to :customer
    has_many :orders
end
