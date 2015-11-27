class Customer < ActiveRecord::Base
  has_many :bills
  has_many :review_books
  has_many :orders
end
