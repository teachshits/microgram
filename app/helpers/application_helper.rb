module ApplicationHelper

	# Return a title on a per-page basis.
  def title
    base_title = "Microgram App"
    if @title.nil?
      base_title
    else
      "#{@title}"
    end
  end

end
