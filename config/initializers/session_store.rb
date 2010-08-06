# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Time Tracking_session',
  :secret      => 'a3a38c8edd8f5429c4a0d557fc5fdd338e716fe9e5ec852524937268d95aa52e30097806b8207788c82e0c538dce5738d5963f9e3d17786873ee9f7ee5c42583'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
