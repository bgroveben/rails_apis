# Each user account contains at least one Notebook.
# Notebooks are used to organize collections of Notes.
# A Resource is a binary data block that is associated with a single Note.
# A Tag is an organizational tool to help users find relevant Notes.
# Each user account contains a set of zero or more Tags.

require 'evernote-oauth'

oauth_token = "OAUTH_TOKEN"

EvernoteOAuth::Client.new(token: oauth_token)
