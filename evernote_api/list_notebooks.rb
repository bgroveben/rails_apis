# Get all of the notebooks from the Sandbox Account.

require 'evernote-oauth'

oauth_token = "OAUTH_TOKEN"
EvernoteOAuth::Client.new(token: oauth_token)
note_store = client.note_store
notebooks = note_store.listNotebooks
