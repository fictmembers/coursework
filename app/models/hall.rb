class Hall < ActiveRecord::Base
    belongs_to :restaurant
    has_many :hostesses

    validates :hall_type, 	      presence: true
    validates :capacity, 	        presence: true, :inclusion => { :in => 1..300, :message => "The height must be between 1 and 300" }
    validates :restaurant_id, 	  presence: true
end
