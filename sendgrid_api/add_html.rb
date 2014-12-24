# Use HTTParty gem to make a POST request to the SendGrid mail API.

require "httparty"
url = "https://sendgrid.com/api/mail.send.json"

response = HTTParty.post url, :body => {
	"api_user" => "API_USERNAME",
	"api_key"  => "API_KEY",
	"to"       => "you@youremail.com",
	"from"     => "me@myemail.com",
	"subject"  => "Hello World!",
	"text"     => "Congratulations! You have sent an email with SendGrid."	
}

response.body
