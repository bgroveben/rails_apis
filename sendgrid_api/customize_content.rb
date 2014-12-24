# Substitution tags allow you to generate dynamic content for each recipient.

require "httparty"
require "json"
url = "https://sendgrid.com/api/mail.send.json"

smtpapi_header = {
	"to" => [ 
		"john@example.com",
	  "jane@example.com" 
	],
	"sub" => {
		"-name-" => [ "John", "Jane" ]
	}
}

response = HTTParty.post url, :body => {
	"api_user"  => "API_USERNAME",
	"api_key"   => "API_KEY",
	"to"        => smtpapi_header,
	"from"      => "me@myemail.com",
	"subject"   => "Using the SMTP API header",
	"html"      => "Hey -name-,<br />-body-",
	"x-smtpapi" => JSON.generate(smtpapi_header)
}

response.body
