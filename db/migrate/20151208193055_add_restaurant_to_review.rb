class AddRestaurantToReview < ActiveRecord::Migration
  def change
    add_column :review_books, :restaurant_id, :integer
    remove_column :review_books, :customer_id
    add_column :review_books, :customer, :string
  end
end
