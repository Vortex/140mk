# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_140.mk_session',
  :secret      => 'f8dbad4bbc0b6023bbac362a9077a4b43adfc1604966e4bf37844fcf9e0a560113caa55e0ff76ee087443779f21a69379037db29eeccb5926c623db14ce217eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
