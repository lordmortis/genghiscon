class UserSessionsController < ApplicationController
	layout "base"
	  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
		@user_session.save do |result|
	    if result
	      flash[:notice] = "Login successful!"
	    redirect_to :controller => "index", :action => "section", :id => "news"
	    else
	      render :action => :new
	    end
		end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
	    redirect_to :controller => "index", :action => "section", :id => "news"
  end
end