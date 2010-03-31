class IndexController < ApplicationController
	filter_access_to :all
	
	layout "base"
	
	def admin
	end
	
	def index
		redirect_to :controller => "content_viewer", :action => "page"
	end
end
