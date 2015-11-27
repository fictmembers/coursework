class Table < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :waiter
    belongs_to :reservation
end
