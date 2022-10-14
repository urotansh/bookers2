class BooksController < ApplicationController
  def index
    # side_menu
    @user = User.find(current_user.id)
    @book = Book.new
    
    # main_menu
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:success] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end

  def show
    # side_menu
    @user = User.find(current_user.id)
    @book = Book.new
    
    # main_menu
    @book_detail = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
