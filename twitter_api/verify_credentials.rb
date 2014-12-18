require 'rubygems'
require 'oauth'

consumer_key = Oauth::Consumer.new(
	"YOUR_CONSUMER_KEY",
	"YOUR_CONSUMER_SECRET")
access_token = Oauth::Token.new(
	"YOUR_ACCESS_TOKEN",
	"YOUR_ACCESS-SECRET")

# All requests will be sent to this server
baseurl = "https://api.twitter.com"

# The verify credentials endpoint returns a 200 status if the request is signed correctly.
address = URI("#{baseurl}/1.1/account/verify_credentials.json")

# Set up Net::Http to use SSL, which is required by Twitter.
http = NET::HTTP.new address.host, address.port
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Build the request and authorize it with Oauth.
request = Net::HTTP:Get.new address.request_uri
request.oauth! http, consumer_key, access_token

# Issue the request and return the response.
http.start
response = http.request request
puts "The response status was #{response.code}"
