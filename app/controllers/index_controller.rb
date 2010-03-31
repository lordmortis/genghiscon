class IndexController < ApplicationController
	filter_access_to :all
	
	layout "base"
	
	def admin
	end
	
	def section
		@section = ContentTag.find_by_name(params[:id].downcase)
		
	end
end
