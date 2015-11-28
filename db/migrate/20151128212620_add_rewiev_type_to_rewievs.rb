class AddRewievTypeToRewievs < ActiveRecord::Migration
  def change
    add_column :review_books, :review_type, :string
  end
end
