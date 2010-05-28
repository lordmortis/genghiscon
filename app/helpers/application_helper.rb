# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def jqueryincludes
		if ENV['RAILS_ENV'] == "production"
	    return javascript_include_tag('jquery-1.4.2.min',
			'json2',
			'utilities'
	    )
	  else
		  return javascript_include_tag('jquery-1.4.2',
			'json2.min',
			'utilities'			
		)
    end
	end

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
