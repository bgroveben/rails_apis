# Get th NoteStore object from the Evernote client.

require 'evernote-oauth'

oauth_token = "OAUTH_TOKEN"
EvernoteOAuth::Client.new(token: oauth_token)
note_store = client.note_store
