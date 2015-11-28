class Reservation < ActiveRecord::Base
    belongs_to :tables
    belongs_to :customers

    validates :RESERV_TIME, 	      presence: true
    validates :table_id, 	          presence: true
    validates :customer_id, 	      presence: true
end
