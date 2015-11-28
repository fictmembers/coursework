class ReviewBook < ActiveRecord::Base
    belongs_to :customer

    validates :REVIEW, 	      presence: true
    validates :review_type,   presence: true
    validates :customer_id, 	presence: true

end
