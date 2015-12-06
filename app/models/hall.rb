class Hall < ActiveRecord::Base
    belongs_to :restaurant
    has_many :hostesses
    has_many :tables

    validates :hall_type, 	      presence: true
    validates :restaurant_id, 	  presence: true
end
