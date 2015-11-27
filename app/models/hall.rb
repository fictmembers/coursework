class Hall < ActiveRecord::Base
    belongs_to :restaurant
    has_many :hostesses
end
