class ReviewBook < ActiveRecord::Base
  belongs_to :restaurants

  validates :restaurant_id, presence: true
  validates :review, presence: true
  validates :review_type, presence: true
  validates :customer,	presence: true
end
