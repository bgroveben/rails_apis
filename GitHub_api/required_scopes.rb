# Check the requires scopes.
# Some methods that return only public information do not require OAuth scopes.

require 'httparty'
require 'json'

token = "TOKEN"
request_headers = {"Authorization" => "token => #{token}",
									 "User-Agent" => "codecademy"
}

response = HTTParty.get "https://api.github.com/user",
					:headers => request_headers
