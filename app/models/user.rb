class User < ActiveRecord::Base
  acts_as_authentic do |c|
  end # block optional

	has_many	:user_roles, :class_name => "UserRole"
	has_many	:roles, :through => :user_roles, :class_name => "Role"
	
	def role_symbols
		roles.map do |role|
			role.name.underscore.to_sym
		end
	end

	def update_twitter_user
		if oauth_token != nil and oauth_secret != nil
			oauth = Twitter::OAuth.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'])
			oauth.authorize_from_access(oauth_token, oauth_secret)

			client = Twitter::Base.new(oauth)
			object = client.verify_credentials
			self.twitter_name = object[:screen_name]
			self.twitter_id = object[:id]
		end
	end
	
	def before_create
		#update_twitter_user
	end
	
	def before_update
		#update_twitter_user
	end

end
