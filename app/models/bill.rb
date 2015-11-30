class Bill < ActiveRecord::Base
    belongs_to :cashier
    belongs_to :customer
    has_many :orders

    validates :created, 	      presence: true
    validates :options, 	      presence: true
    validates :summary, 	      presence: true, :inclusion => {:in => 1..10000}
    validates :cashier_id, 	    presence: true
    validates :customer_id, 	  presence: true
end
