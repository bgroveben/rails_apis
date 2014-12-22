# We want to see how many private repositories our "API Padawan" user has
# on github.com. We discover that calling the "/user" method with a token
# with no scopes doesn't return the information that we want.
# Let's make a call to the method and inspect the headers to determine
# what scope we need on out token.

require 'httparty'
require 'json'

class GitHub
	include HTTParty
	headers "User-Agent" => "codecdemy"

	def initialize(options = {})
		@auth = {
			:username => options[:username],
			:password => options[:password]
		}
		@token = options[:token]
	end

	def check_accepted_scopes_for(endpoint)
		endpoint = "https://api.github.com#{endpoint}"
		headers  = {"Authorization" => "token #{@token}"}

		response = self.class.get(endpoint, :headers => headers)
		puts response.headers["X-Accepted-OAuth-Scopes"].split(",").map(&:strip)
	end

	def create_token(scopes = [])
		endpoint = "https://api.github.com/authorizations"
		post_body = {:scopes => scopes}
		response = self.class.post endpoint, {
			:body       => post_body.to_json
			:basic_auth => @auth
		}
		response.parsed_response
	end
end

# Use Basic Auth to get a token
client = GitHub.new(:username => "api-padawan", :password => "GitHubPassw0rd")
token  = client.create_token

# Use OAuth to check scopes for a method
client = GitHub.new(:token => token["token"])
scopes = client.check_accepted_scopes_for("/user")

puts scopes

# Use Basic Auth to create a new token with desired scopes
client = GitHub.new(:username => "api-padawan", :password => "GitHubPassw0rd")
token  = client.create_token(["user"])

puts token.inspect
