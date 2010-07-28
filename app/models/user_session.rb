class UserSession < Authlogic::Session::Base

  def self.oauth_consumer
    OAuth::Consumer.new("TOKEN", "SECRET",
    { :site=>"http://twitter.com",
      :authorize_url => "http://twitter.com/oauth/authenticate" })
  end

end
