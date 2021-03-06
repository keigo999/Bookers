class BooksController < ApplicationController
  
  def index
  	@books = Book.all.order(created_at: 'desc')
  	@book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to edit_book_path(book.id)
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path,notice: "Book was successfully destroyed."
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end


end
