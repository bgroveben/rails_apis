require 'httparty'

token = "TOKEN"

user = HTTParty.get "https://api.github.com/user",
				:headers => {
												"Authorization" => "token #{token}",
												"User-Agent" => "codecademy"
										}

puts "Hi, my username is #{user["login"]}"
