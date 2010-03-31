class ContentViewerController < ApplicationController
	layout "base"

	def page
		@page = nil
		if params[:id] != nil
			@page = ContentPage.find_by_name(params[:id].downcase)
		else
			@page = ContentPage.find_by_home(true)
			if @page != nil
				redirect_to :action => "page", :id => @page.name
			end
		end
		
		if @page == nil
			redirect_to :action => "admin", :controller => "index"
		elsif	@page.block != nil
			@block = @page.block
			render :action => "content", :id => @page.block.id
		end
	end
	
	def content
		@block = ContentBlock.find(params[:id])
		if @block == nil
			redirect_to :action => "section"
		end
	end

	def tag
		@tag = ContentTag.find_by_name(params[:id])
		if @tag == nil
			redirect_to :action => "section"
		end
	end
end
