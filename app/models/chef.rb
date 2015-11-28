class Chef < ActiveRecord::Base
    belongs_to :restaurant
    has_many :orders

    validates :LASTNAME, 	      presence: true
    validates :restaurant_id, 	presence: true
end
