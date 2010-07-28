# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
	config.gem "json"
	config.gem "oauth2"
	config.gem "authlogic"
	
	config.gem "declarative_authorization"

	# used by the CMS
	config.gem 'RedCloth'
	config.gem "bitly"
	config.gem 'oauth'
	config.gem 'twitter'
	

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end

Bitly.use_api_version_3

# probably should change this to memcache on production
#OpenIdAuthentication.store = :file

ENV['BITLYUSER']  = "lordmortis"
ENV['BITLYKEY']  = "R_e45d05c52caa953ebc840458e147b9fb"

ENV['TWITTER_CONSUMER_KEY'] = "SvbaMrcFqEqs3FLOX7uGfQ"
ENV['TWITTER_CONSUMER_SECRET'] = "w88I4yOC9QRY8bkh6NK0k72I6iSxTisv64yHslNs"

ENV['TWITTER_ACCESS_TOKEN'] = "116678000-14ZGOWLoUF2FC4AY4aVmckYWkTqMkz6bAJpoJUk"
ENV['TWITTER_ACCESS_SECRET'] = "2U1dgdhxZ0qOAesRDBrChyfk3r7sMKlFK7knuwk"