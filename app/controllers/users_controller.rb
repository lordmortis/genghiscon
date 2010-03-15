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
	  if @user.save
	    flash[:notice] = "Registration successful."
			# TODO: redirect to where the user came from before logging in...
			logger.debug("This should be redirecting...")
	    redirect_to :controller => "index"
	  else
	    render :action => 'new'
	  end
	end

	def edit
	  @user = current_user
	end

	def update
	  @user = current_user
		@user.attributes = params[:user]
	  if @user.save
	    flash[:notice] = "Successfully updated profile."
			# TODO: redirect to where the user came from before logging in...
	    redirect_to :controller => "index"
	  else
	    render :action => 'edit'
	  end
	end	
end
