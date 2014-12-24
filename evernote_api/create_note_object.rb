require 'evernote-oauth'

oauth_token = "OAUTH_TOKEN"
EvernoteOAuth::Client.new(token: oauth_token)
note_store = client.note_store
notebooks = note_store.listNotebooks
Evernote::EDAM::Type::note.new
note.title => "Hello from Codecademy!"
