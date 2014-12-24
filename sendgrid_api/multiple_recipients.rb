# SendGrid allows acess to the SMTP API.

require "httparty"
require "json"
url = "https://sendgrid.com/api/mail.send.json"

smtpapi_header = {
	"to" => [ 
		"test@hotmail.com",
	  "test@gmail.com" 
	]
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
