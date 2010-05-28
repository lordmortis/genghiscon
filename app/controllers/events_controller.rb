class EventsController < ApplicationController
	filter_resource_access
	layout "base"

  def index
    @events = Event.find(:all)

    respond_to do |format|
      format.html # index.html.erb
			format.mobile # index.mobile.erb
			format.json  { render :json => @events.to_json(Event.default_data_hash) }
    end
  end

  def show
		@event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
			format.mobile # index.mobile.erb
			format.json { render :json => @event.to_json(Event.default_data_hash) }
		end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
			format.mobile # index.mobile.erb
			format.json  { render :json => @events.to_json(Event.default_data_hash) }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
			format.html { redirect_to(events_url) }
    end
  end
end