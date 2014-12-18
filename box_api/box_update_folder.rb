require "rest-client"
require "json"

your_folder_id = "FOLDER_ID"

body = {"description" => "I made this on Codecademy!"}
response = RestClient.put(
	"https://api.box.com/2.0/folders/#{your_folder_id}",
	JSON.generate(body),
	:authorization => "Bearer " << "ACCESS_CODE"
)

JSON.parse(response.body)["description"]
