require "rest-client"
require "json"

body = {
	"name" => "Benjamin Grove",
	"parent" => {
		"id" => "0"
	}
}

response = RestClient.post(
	"https://api.box.com/2.0/folders",
	JSON.generate(body),
	{:authorization => "Bearer " << "ACCESS_CODE"}
)

puts "COPY THIS NUMBER: " + JSON.parse(response.body)['id']
