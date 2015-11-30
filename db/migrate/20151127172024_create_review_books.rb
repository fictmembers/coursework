class CreateReviewBooks < ActiveRecord::Migration
  def change
    create_table :review_books do |t|
      t.string :review
      t.references :customer

      t.timestamps null: false
    end
  end
end
