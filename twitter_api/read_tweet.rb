require 'rubygems'
require 'oauth'
require 'json'

# Fetch /1.1/statuses/show.json, which takes an id parameter and 
# returns the representation of a single tweet.
 baseurl = "https://api.twitter.com"
 path    = "/1.1/statuses/show.json"
 query   = URI.encode_www_form("id" => "266270116780576768")
 request = Net::HTTP::Get.new address.request_uri

# Print data about a tweet.
def print_tweet(tweet)
	puts tweet["user"]["name"] + " - " + tweet["text"]
end

# Set up HTTP.
http             = Net:HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# The ||= operator will only assign these values if they are not already set.
consumer_key ||= Oauth::Consumer.new "CONSUMER_KEY", ""
access_token ||= Oauth::Token.new "ACCESS_TOKEN", ""

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the tweet if the response code was 200
tweet = nil
if response.code == '200' then
	tweet = JSON.parse(response.body)
	print_tweet(tweet)
end
