class CommentsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
  	before_filter :correct_user,   only: :destroy

	def create
		@comment = current_user.comments.build(params[:comment])
	    if @comment.save
	      	flash[:success] = "Comment created!"
	      	redirect_to root_url
	    else
	    	@feed_items = []
	      	render 'pages/home'
	    end
	end

	def destoy
		@comment.destroy
    	redirect_to root_url
	end

	private 
  	def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_url if @comment.nil?
    end


end