module ContentTwitterLib
	class Setup
		def Setup.GetRequestTokens
			if ENV['TWITTER_CONSUMER_KEY'] == nil or ENV['TWITTER_CONSUMER_SECRET'] == nil
				print("Please Set up your CMS as a Twitter application at http://dev.twitter.com/apps/new\n")
				print "Add the following to your environment file:\n\n"
				print "ENV['TWITTER_CONSUMER_KEY'] = \"YOUR CONSUMER KEY\"\n"
				print "ENV['TWITTER_CONSUMER_SECRET'] = \"YOUR CONSUMER SECRET\"\n"
				return
			end
		end
	
		def Setup.AuthorizePostingAccount
			if ENV['TWITTER_CONSUMER_KEY'] == nil or ENV['TWITTER_CONSUMER_SECRET'] == nil or 
				print("Please run ContentTwitterLib::Setup.GetRequestTokens first")
				return
			end

			consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'],  {:site => 'http://twitter.com'})
			request_token = consumer.get_request_token										
			print "Visit the following URL to authorize this application - be sure to use the account you wish to post from.\n\n"
			print request_token.authorize_url + "\n\n"
			
			print "Please put the following into your environment file:\n\n"
			print "ENV['TWITTER_REQUEST_TOKEN'] = \"#{request_token.token}\"\n"
			print "ENV['TWITTER_REQUEST_SECRET'] = \"#{request_token.secret}\"\n"
			print "ENV['TWITTER_ACCESS_PIN'] = \"Pin returned from authorization URL\""

			print("\n\n Then run ContentTwitterLib::Setup.GetAccessToken")

		end
	end
	
	def Setup.GetAccessToken
		if ENV['TWITTER_CONSUMER_KEY'] == nil or ENV['TWITTER_CONSUMER_SECRET'] == nil or 
				ENV['TWITTER_REQUEST_TOKEN'] == nil or ENV['TWITTER_REQUEST_SECRET'] == nil or ENV['TWITTER_ACCESS_PIN'] == nil
			print("Please set up the earlier steps first.")	
		end

		oauth = Twitter::OAuth.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'])
		oauth.authorize_from_request(ENV['TWITTER_REQUEST_TOKEN'], ENV['TWITTER_REQUEST_SECRET'], ENV['TWITTER_ACCESS_PIN'])
		access_token = oauth.access_token

		print "Please put the following into your environment file:\n\n"
		print "ENV['TWITTER_ACCESS_TOKEN'] = \"#{access_token.token}\"\n"
		print "ENV['TWITTER_ACCESS_SECRET'] = \"#{access_token.secret}\"\n"

		print("\n\n You can remove the Request Token and Access Pin lines.\nRun ContentTwitterLib::Setup.TestPosting to test")
	end
	
	def Setup.Working
		ENV['TWITTER_CONSUMER_KEY'] != nil and ENV['TWITTER_CONSUMER_SECRET'] != nil and ENV['TWITTER_ACCESS_TOKEN'] != nil and ENV['TWITTER_ACCESS_SECRET'] != nil
	end
	
	def Setup.TestPosting
		if ENV['TWITTER_CONSUMER_KEY'] == nil or ENV['TWITTER_CONSUMER_SECRET'] == nil or 
				ENV['TWITTER_ACCESS_TOKEN'] == nil or ENV['TWITTER_ACCESS_SECRET'] == nil
		end

		oauth = Twitter::OAuth.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'])
		oauth.authorize_from_access(ENV['TWITTER_ACCESS_TOKEN'], ENV['TWITTER_ACCESS_SECRET'])

		client = Twitter::Base.new(oauth)
		client.update('MortisCMS Test!')
	end	
	
end