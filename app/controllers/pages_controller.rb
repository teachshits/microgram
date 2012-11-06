class PagesController < ApplicationController
  def home
  	@title = "Home"
  	if signed_in?
      @post  = current_user.posts.build
      @comment = current_user.comments.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact
  	@title = "Contact"
  end

  def about
  	@title = "About"
  end
end
