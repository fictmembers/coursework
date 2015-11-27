class Chef < ActiveRecord::Base
    belongs_to :restaurant
    has_many :orders
end
