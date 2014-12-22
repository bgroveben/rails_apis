# See what level of access this token provides for the user.

require 'httparty'
require 'json'

token = "TOKEN"
request_headers = {"Authorization" => "token => #{token}",
									 "User-Agent" => "codecademy"
}

response = HTTParty.get "https://api.github.com",
					:headers => request_headers
