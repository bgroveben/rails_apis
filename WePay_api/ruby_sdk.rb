# Download the Ruby SDK at https://github.com/wepay/ruby-sdk or gem install wepay.
# This file does the same thing as the call in add_params.rb.
require 'wepay'

# Credentials
client_id = 'CLIENT_ID'
client_secret = 'CLIENT_SECRET'
access_token = 'STAGE_df1684a1c7b91f0de51b72e5890891b92d34e47fb3cb48d4dbd8d2a89fa253cc'

wepay = WePay.new(client_id, client_secret)
response = wepay.call('/checkout/create', access_token, {
		:account_id => 161624111,
		:short_description => 'A brand new soccer ball',
		:type => 'GOODS',
		:amount => '24.95'
})

puts response
