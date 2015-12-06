class ReviewBooksController < ApplicationController
  def new
    @review_book = ReviewBook.new()
  end

  def index
    @review_books = ReviewBook.all
  end

  def create
    @review_book = ReviewBook.new(review_book_params)
    @review_book.save

    redirect_to resivefeed_path
  end

  def show
    @review_book = ReviewBook.find(params[:id])
    @customer = Customer.find(@review_book.customer_id)
  end

  def edit
    @review_book = ReviewBook.find(params[:id])
  end

  def update
    @review_book = ReviewBook.find(params[:id])

    if @review_book.update_attributes(review_book_params)
      redirect_to review_books_path
    else
        render 'edit'
    end
  end

  def resivefeed
  end

  def destroy
    ReviewBook.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def review_book_params
    params.require(:review_book).permit(:review, :customer_id, :review_type)
  end
end
