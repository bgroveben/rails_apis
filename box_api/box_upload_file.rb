require "rest_client"
require "json"

your_folder_id = "FOLDER_ID"

your_filename = "I made this on Codecademy!" + ".txt"

f = File.open(your_filename, "w")

f.write("I'm on my way back to Box!")
f.close

response = RestClient.post(
	"https://api.box.com/2.0/files/content",
	{
		# We need to read the file again to send it to Box.
		:myFile => File.new("I made this on Codecademy!", 'rb'),
		# This tells Box where to put the file.
		:parent_id => "I made this on Codecademy!"
	},
	:authorization => "Bearer " << "ACCESS_CODE"
)

puts JSON.parse(response.body)["entries"][0]["name"]
