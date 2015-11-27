class Hostess < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :hall
end
