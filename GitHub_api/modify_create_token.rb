# Use HTTParty library to create a Ruby wrapper for part of the GitHub API.

require 'httparty'
require 'json'

class GitHub
	API_CLIENT_ID 		= 'CLIENT_ID'
	API_CLIENT_SECRET = 'CLIENT_SECRET'

	include HTTParty
	headers "User-Agent" => "codecademy"
	basic_auth "api-padawan", "GitHubPassw0rd"

	def create_token
		endpoint = "https://api.github.com/authorizations"
		post_body = {:client_id => API_CLIENT_ID,
								 :client_secret => API_CLIENT_SECRET
		}
		self.class.post endpoint, :body => post_body.to_json
	end
end

client = GitHub.new
response = client.create_token

puts response.parsed_response
