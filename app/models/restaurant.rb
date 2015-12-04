class Restaurant < ActiveRecord::Base
    has_many :cashiers
    has_many :waiters
    has_many :managers
    has_many :halls
    has_many :hostesses
    has_many :chefs
    has_many :tables

    validates :name, 	  	presence: true
    validates :address, 	presence: true
    validates :tel,       presence: true, length: { minimum: 8 }
end
