# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def tag_list(object)
		value = ""
		for tag in object.tags
			value += link_to(tag.name, tag)
			value += ", "
		end
		if value != ""
			value = value[0..-3]
		end
		
		value
	end
	
	def page_list(object)
		value = ""
		for page in object.pages
			value += link_to(page.name, page)
			value += ", "
		end
		if value != ""
			value = value[0..-3]
		end
		
		value
	end
	

end
