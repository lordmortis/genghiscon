class UserSession < Authlogic::Session::Base

	def self.oauth_consumer
		OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'],
		{ :site=>"http://twitter.com",
			:authorize_url => "http://twitter.com/oauth/authenticate" })
	end
end
