class UsersController < ApplicationController
	layout "base"

  def new
    @user = User.new
  end

	def create
	  @user = User.new(params[:user])
		if !verify_recaptcha(:model => @user, :message => "Sorry! We couldn't verify that you were a human :(")
			render :action => 'new'
		end

 		@user.save do |result|
	    if result
		    flash[:notice] = "Registration successful."
				# TODO: redirect to where the user came from before creating user
		    redirect_to :controller => "content_viewer", :action => "page"
	    else
	      render :action => :new
	    end
		end
	end

	def edit
	  @user = current_user
	end

	def update
	  @user = current_user
		@user.attributes = params[:user]

 		@user.save do |result|
	    if result
		    flash[:notice] = "Successfully updated profile."
				# TODO: redirect to where the user came from before logging in...
		    redirect_to :controller => "content_viewer", :action => "page"
	    else
	      render :action => :edit
	    end
		end
	end	
end
