authorization do
	role :admin do
		has_permission_on [:users], :to => [:new, :index, :create, :edit, :update, :send_new_mail, :send_mail]
	end
	
	role :employee do
		has_permission_on [:users], :to => [:new, :index, :create, :edit, :update, :send_new_mail, :send_mail]		
	end
	
	role :guest do
		has_permission_on [:users], :to => [:index, :create, :edit, :update]		
	end
end