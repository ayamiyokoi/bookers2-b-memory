class BooksController < ApplicationController

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    @user_new = @book.user
    @book_comment = BookComment.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @books0 = Book.where(created_at: Time.zone.now.all_day)
    @books1 = Book.where(created_at: 1.day.ago.all_day)
    @books2 = Book.where(created_at: 2.day.ago.all_day)
    @books3 = Book.where(created_at: 3.day.ago.all_day)
    @books4 = Book.where(created_at: 4.day.ago.all_day)
    @books5 = Book.where(created_at: 5.day.ago.all_day)
    @books6 = Book.where(created_at: 6.day.ago.all_day)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      @books = Book.all
      render "index"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
