class BooksController < ApplicationController
	before_action :authenticate_user!

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have created book successfully."
			redirect_to book_path(@book)
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
  		end
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