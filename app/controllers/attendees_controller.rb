class AttendeesController < ApplicationController
	filter_resource_access
	layout "base"
	
	before_filter :getevent

	def index
		@attendees = @event.attendees.all

    respond_to do |format|
      format.html # show.html.erb
			format.mobile # index.mobile.erb
			format.json  { render :json => @attendees.to_json(Attendee.default_data_hash) }
		end
	end

  def show
		@attendee = Attendee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
			format.mobile # index.mobile.erb
		end
  end

  def new
    @attendee = Attendee.new

    respond_to do |format|
      format.html # new.html.erb
			format.mobile # index.mobile.erb
    end
  end

  def edit
    @attendee = Attendee.find(params[:id])
  end

  def create
    @attendee = Attendee.new(params[:attendee])
		@attendee.event = @event
    respond_to do |format|
      if @attendee.save
        flash[:notice] = 'Attendee was successfully created.'
        format.html { redirect_to(@attendee.event) }
        format.json  { render :json => @attendee.to_json(Attendee.default_data_hash), :status => :created }

      else
        format.html { render :action => "new" }
 				format.json  { render :json => @attendee.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @attendee = Attendee.find(params[:id])
    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.json  { render :json => { :id => @attendee.id }.to_json }
      else
        format.html { render :action => "edit" }
 				format.json  { render :json => @attendee.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
		oldid = @attendee.id
    @attendee.destroy

    respond_to do |format|
			format.html { redirect_to(events_url) }
	 		format.json  { render :json => { :id => oldid }.to_json }
    end
  end

	private
	def getevent
		@event = Event.find(params[:event_id])
	end
end