authorization do
	role :executive do
		has_permission_on [:content_blocks], :to => [:new, :index, :create, :edit, :update, :show, :destroy, :preview, :publish, :unpublish]
		has_permission_on [:content_tags], :to => [:new, :index, :create, :edit, :update, :show, :destroy]
		has_permission_on [:content_pages], :to => [:new, :index, :create, :edit, :update, :show, :destroy]
		has_permission_on [:events], :to => [:new, :index, :create, :edit, :update, :show, :destroy]
		has_permission_on [:attendees], :to => [:new, :index, :create, :edit, :update, :show, :destroy]
		has_permission_on [:index], :to => [:index, :admin, :section]
	end
	
	role :committee do
		has_permission_on [:content_blocks], :to => [:new, :index, :create, :edit, :update, :show, :preview, :publish, :unpublish]
		has_permission_on [:content_tags], :to => [:new, :index, :create, :edit, :update, :show]
		has_permission_on [:content_pages], :to => [:new, :index, :create, :edit, :update, :show]
		has_permission_on [:events], :to => [:new, :index, :create, :edit, :update, :show]
		has_permission_on [:attendees], :to => [:new, :index, :create, :edit, :update, :show]	
		has_permission_on [:index], :to => [:index, :admin, :section]
	end
	
	role :member do 
		has_permission_on [:index], :to => [:index, :section]
		has_permission_on [:content_blocks], :to => [:show]
	end
	
	role :guest do
		has_permission_on [:index], :to => [:index, :section]
		has_permission_on [:content_blocks], :to => [:show]
	end
end