require "easypost"

EasyPost.api_key = "API_KEY"
EasyPost::Address.verify(
	:street1 => "170 N Harbor Dr",
	:street2 => "",
	:city    => "Redondo Beach",
	:state   => "CA",
	:zip     => "90277"
)
