class UsersController < ApplicationController
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
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
