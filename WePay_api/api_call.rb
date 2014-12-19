require 'uri'
require 'json'
require 'net/http'
require 'net/https'
require 'cgi'

headers = {
					'Content-Type' => 'application/json'
					'User-Agent'   => 'Codecademy WePay Demo'
					}  
params  = {}  # Any parameters needed for the API call.
url = URI.parse('https://stage.wepayapi.com/v2/user')  # URL of the call.
call = Net::HTTP::Post.new(url.path, initheader = headers)
call.add_field('Authorization: Bearer', 'STAGE_df1684a1c7b91f0de
51b72e5890891b92d34e47fb3cb48d4dbd8d2a89fa253cc')
call.body = params.to_json

request = Net::HTTP.new(url.host, url.port)
request.read_timeout = 30
request.use_ssl = true

# Make HTTP request
response = request.start { |http| http.request(call) }

# Response in JSON 
puts JSON.parse(response.body)
