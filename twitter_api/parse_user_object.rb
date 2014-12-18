# Parse the API response and print out the current user's screen name.

require 'rubygems'
require 'oauth'
require 'JSON'

# Parse a response from the API and return a user object.
def parse_user_response(response)
	user = response.body

	# Check for a successful request
	if response.code == '200'
		user = JSON.parse(user)
		puts "Hello, #{user["screen_name"]}!"
	else
		puts "Expected a response of 200, but got #{response.code} instead."
	end
	user
end

# All requests will be sent to this server.
baseurl = "https://api.twitter.com"

# Verify credentials returns the current user in the body of the response.
http             = Net:HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# The ||= operator will only assign these values if they are not already set.
consumer_key ||= Oauth::Consumer.new "CONSUMER_KEY", ""
access_token ||= Oauth::Token.new "ACCESS_TOKEN", ""

# Issue the request.
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token
http.start
response = http.request(request)
user = parse_user_response(response)

