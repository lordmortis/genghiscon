class FacebookController < ApplicationController
	layout "facebook"
	
	filter_parameter_logging :fb_sig_friends, :password
#	ensure_authenticated_to_facebook [:except => 'index']
	
	def index
		@page = ContentPage.find_by_home(true)
	end
	
	def content
		@block = ContentBlock.find(params[:id])
	end

	def tag
		@tag = ContentTag.find_by_name(params[:id])
	end
end
