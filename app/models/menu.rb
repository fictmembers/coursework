class Menu < ActiveRecord::Base
  has_many :items

  validates :cuisine, 	      presence: true
end
