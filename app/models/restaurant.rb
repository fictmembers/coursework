class Restaurant < ActiveRecord::Base
    has_one :cashier
    has_one :manager
    has_many :waiters
    has_many :halls
    has_many :hostesses
    has_many :chefs
    has_many :tables
    has_many :orders
    has_many :items

    validates :name, 	  	presence: true
    validates :address, 	presence: true
    validates :tel,       presence: true, length: { minimum: 8 }
end
