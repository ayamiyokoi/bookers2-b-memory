class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @books_today = Book.where(created_at: Time.zone.now.all_day, user_id: @user.id)
    @books_yesterday = Book.where(created_at: 1.day.ago.all_day, user_id: @user.id)
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    @books_a_week_ago = Book.where(created_at: from...to, user_id: @user.id)
    today = Time.current.at_end_of_day
    to  = (today - 7.day).at_beginning_of_day
    from  = (to - 13.day).at_beginning_of_day
    @books_two_week_ago = Book.where(created_at: from...to, user_id: @user.id)
  end

  def index
    @users = User.all
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end