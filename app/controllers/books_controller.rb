class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(@user)
  end

  def show
    @book = Book.new(book_params)
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
