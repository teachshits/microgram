class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:index, :destroy]
	before_filter :admin_user,     only: :destroy
	
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
			sign_in @user
			flash[:success] = "You are welcome!"
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	end

	def index
		@title = "All users"
    	@users = User.paginate(page: params[:page])
  	end

  	def destroy
    	User.find(params[:id]).destroy
    	flash[:success] = "User destroyed."
    	redirect_to users_url
  	end

	private


    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
