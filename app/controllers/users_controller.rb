class UsersController < ApplicationController

	#attr_accessor :name, :email 
	def show
		@user = User.find(params[:id])
		@title = @user.name
	end
	def new
		@title = "Sign up"
		@user = User.new
	end
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "You are welcome!"
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	end
end
