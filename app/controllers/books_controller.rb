class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit]

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def create
		@user = current_user
		@book = Book.new(book_params)
		@books = Book.all
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book)
		else
			render :index
		end
	end

	def show
		@book = Book.new
		@current_user = current_user
		@show_book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
  		if @book.update(book_params)
  			flash[:notice] = "You have updated book successfully."
  			redirect_to book_path(@book)
  		else
  			render :edit
  		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def correct_user
		book = Book.find_by(id: params[:id])
		if current_user.id != book.user_id
			redirect_to books_path
		end
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
