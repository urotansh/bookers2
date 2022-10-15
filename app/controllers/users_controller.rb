class UsersController < ApplicationController
  def index
    # side_menu
    @user = User.find(current_user.id)
    @book = Book.new
    
    # main_menu
    @users = User.all
  end
  
  def show
    # side_menu
    @user = User.find(params[:id])
    @book = Book.new
    
    # main_menu
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
