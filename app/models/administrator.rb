class Administrator < ActiveRecord::Base
    belongs_to :restaurant

    validates :lastname, 	presence: true
    validates :tel,       presence: true, length: { minimum: 8 }
    validates :restaurant_id, 	presence: true
end
