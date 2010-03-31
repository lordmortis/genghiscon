class ContentPagesController < ApplicationController
	filter_resource_access
	layout "base"

  def index
    @content_pages = ContentPage.all
  end
  
  def show
    @content_page = ContentPage.find(params[:id])
  end
  
  def new
    @content_page = ContentPage.new
  end
  
  def create
    @content_page = ContentPage.new(params[:content_page])
    if @content_page.save
      flash[:notice] = "Successfully created content page."
      redirect_to @content_page
    else
      render :action => 'new'
    end
  end
  
  def edit
    @content_page = ContentPage.find(params[:id])
  end
  
  def update
    @content_page = ContentPage.find(params[:id])
    if @content_page.update_attributes(params[:content_page])
      flash[:notice] = "Successfully updated content page."
      redirect_to @content_page
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @content_page = ContentPage.find(params[:id])
    @content_page.destroy
    flash[:notice] = "Successfully destroyed content page."
    redirect_to content_pages_url
  end
end
