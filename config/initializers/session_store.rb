# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_genghiscon_session',
  :secret      => '2a9a714a65734f29c122602dfc33dd039df0b4d8e3acefa7d6e0b6794550ef88c0cbe45a69ad27e1e58ebf26c74a7e91f61082a668e1c4210b9a6707e3fc44c4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
