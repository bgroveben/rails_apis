# The content is represented using Evernote Markup Language (ENML).

require 'evernote-oauth'

oauth_token = "OAUTH_TOKEN"
EvernoteOAuth::Client.new(token: oauth_token)
note_store = client.note_store
notebooks = note_store.listNotebooks
Evernote::EDAM::Type::note.new
note.title => "Hello from Codecademy!"
note.content = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd"><en-note>Hello Evernote<br/><en-note>'
 