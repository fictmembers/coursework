class Hall < ActiveRecord::Base
    belongs_to :restaurant
    has_many :hostesses

    validates :HALL_TYPE, 	      presence: true
    validates :CAPACITY, 	        presence: true, :inclusion => { :in => 1..300, :message => "The height must be between 1 and 300" }
    validates :restaurant_id, 	  presence: true
end
