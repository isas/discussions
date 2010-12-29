# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_discussions_session',
  :secret      => '4a4cf1000a4bf5912eb853e43416b56a634310ee7f8f20a4b4f9964397003de703bb8f190f084a87954671266bbe577e6063343dea159d377bfb146b78b68158'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
