class ContentTagsController < ApplicationController
	filter_resource_access

	layout "base"

  def index
    @tags = ContentTag.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
		@tag = ContentTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
		end
  end

  def new
    @tag = ContentTag.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @tag = ContentTag.find(params[:id])
  end

  def create
    @tag = ContentTag.new(params[:content_tag])
    respond_to do |format|
      if @tag.save
        flash[:notice] = 'Tag was successfully created.'
        format.html { redirect_to(@tag) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @tag = ContentTag.find(params[:id])
    respond_to do |format|
      if @tag.update_attributes(params[:content_tag])
        flash[:notice] = 'Tag was successfully updated.'
        format.html { redirect_to(@tag) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @tag = ContentTag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(content_tags_url) }
    end
  end	
end