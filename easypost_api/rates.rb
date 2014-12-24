require "easypost"

EasyPost.api_key = "API_KEY"
EasyPost::Postage.compare(
	:parcel => {
		:weight => 1.1,
		:height => 12,
		:width  => 14,
		:length => 7
	},
	:to => {
		:name => "Not Me"
		:street1 => "170 N Harbor Dr",
		:street2 => "",
		:city    => "Redondo Beach",
		:state   => "CA",
		:zip     => "90277"
	},
	:from => {
		:name => "Me",
		:street1 => "1234 Anywhere Rd",
		:street2 => "",
		:city    => "Portlandia",
		:state   => "OR",
		:zip     => "12345"
	}
)