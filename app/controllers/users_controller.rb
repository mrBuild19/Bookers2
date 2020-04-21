class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@user = current_user
  	@users = User.all
  	@book = Book.new
  end

  def show
  	@current_user = current_user
  	@user = User.find(params[:id])
  	@book = Book.new
  	@show_book = Book.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
