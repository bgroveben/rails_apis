# Look up a piece of postage and get the URL for the label.

require "easypost"

EasyPost.api_key = "API_KEY"
EasyPost::Postage.get("test.png")
