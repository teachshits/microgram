module ApplicationHelper


	def logo
		logo = image_tag( "parody.jpeg")
	end

	  def title
	    base_title = "Microgram App"
	    if @title.nil?
	      base_title
	    else
	      "#{@title}"
	    end
	  end

end
