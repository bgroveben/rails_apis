require 'rubygems'
require 'oauth'
require 'json'

# Return a list of public tweets from the specified account.
baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/user_timeline.json" 
query   = URI.encode_www_form(
 				"screen_name" => "twitterapi",
 				"count" => 10, # Print the laast 10 tweets
)
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri

# Print data about a list of tweets.
def print_timeline(tweets)
	tweets.each do |tweet|
	puts tweet['text']
	end
end

# Set up HTTP
http             = Net:HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# The ||= operator will only assign these values if they are not already set.
consumer_key ||= Oauth::Consumer.new "CONSUMER_KEY", ""
access_token ||= Oauth::Token.new "ACCESS_TOKEN", ""

# Parse and print the tweet if the response code was 200
tweets = nil
if response.code == '200' then
	tweets = JSON.parse(response.body)
	print_tweet(tweets)
end
nil