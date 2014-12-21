# Use HTTParty library to create a Ruby wrapper for part of the GitHub API.

require 'httparty'
require 'json'

class GitHub
	include HTTParty
	headers "User-Agent" => "codecademy"
	basic_auth "api-padawan", "GitHubPassw0rd"

	def create_token
		endpoint = "https://api.github.com/authorizations"
		self.class.post endpoint, :body => {}.to_json
	end
end

client = GitHub.new
response = client.create_token

# puts response.parsed_response
puts response.inspect