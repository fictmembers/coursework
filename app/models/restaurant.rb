class Restaurant < ActiveRecord::Base
    has_many :cashiers
    has_many :waiters
    has_many :administrators
    has_many :halls
    has_many :hostesses
    has_many :chefs
    has_many :tables
end
