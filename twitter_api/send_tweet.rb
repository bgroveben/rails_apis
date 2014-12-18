require 'rubygems'
require 'oauth'
require 'json'

# Set application type to read/write on dev.twitter.com and generate token.
consumer_key = Oauth::Consumer.new(
	"YOUR_CONSUMER_KEY",
	"YOUR_CONSUMER_SECRET")
access_token = Oauth::Token.new(
	"YOUR_ACCESS_TOKEN",
	"YOUR_ACCESS-SECRET")

# Note that the type of request has changed to POST.
# The request parameters have also moved to the body 
# of the request instead of being put in the URL.

baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/update.json"
address = URI("#{baseurl}#{path}")
request = Net::HTTP::Post.new address.request_uri
request.set_form_data(
	"status" => "Trying out Twitter's API. Let's see if this works.",
)

# Set up HTTP
http             = Net:HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Parse and print the tweet if the response code was 200.
tweet = nil
if response.code == '200' then
	tweet = JSON.parse(response.body)
	puts "Successfully sent #{tweet["text"]}"
else
	puts "Could not send the Tweet! " +
	"Code:#{response.code} Body:#{response.body}"
end
