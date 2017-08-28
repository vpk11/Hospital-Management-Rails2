# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hospital_session',
  :secret      => '792b30bfb13ef6f1fba7ab7a24a29f0f70f4e5bc012615c1c4aa00b82bbe1bf860bd013924ca8993d8ca113ad0ecf71bffcae2a9f7be45b6228b6f478096431b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
