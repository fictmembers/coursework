class Reservation < ActiveRecord::Base
  belongs_to :tables
  belongs_to :customers

  validates :reserv_time, presence: true
  validates :table_id, presence: true
  validates :from, presence: true
  validates :table_id, uniqueness: { scope: [:reserv_time, :from], message: "Its' already reserved table!" }
end
