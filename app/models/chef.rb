class Chef < ActiveRecord::Base
    belongs_to :restaurant
    has_many :orders

    validates :lastname, 	      presence: true
    validates :restaurant_id, 	presence: true
end
