class ReviewBooksController < ApplicationController

  def new
  @review_book = Reviewbook.new()
end

def index
  @review_book = Reviewbook.all
end

def create
  @review_book = Reviewbook.new(review_book_params)
end

def show
  @review_book = Reviewbook.find(params[:id])
end

def edit
  @review_book = Reviewbook.find(params[:id])
end

def update
  @review_book = Reviewbook.find(params[:id])

  if @review_book.update_attributes(review_book_params)
    redirect_to review_books_path
  else
      render 'edit'
  end
end

def destroy
  Reviewbook.find(params[:id]).destroy
  redirect_to :back
end

private

def review_book_params
  params.require(:review_book).permit(:REVIEW, :OPTIONS, :SUMMARY)
end

end
