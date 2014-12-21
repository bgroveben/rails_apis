# Download the Ruby SDK at https://github.com/wepay/ruby-sdk or gem install wepay.
# This file does the same thing as the call in add_params.rb.
require 'wepay'

# Credentials
client_id = 'CLIENT_ID'
client_secret = 'CLIENT_SECRET'
access_token = 'ACCESS_TOKEN'

wepay = WePay.new(client_id, client_secret)
response = wepay.call('/preapproval/create', access_token, {
		:account_id => 161624111,
		:period => 'monthly',
		:end_time => '2015-12-25',
		:amount => '19.99',
		:short_description => 'A subscription to our magazine.',
		:redirect_uri => 'http://example.com/success/',  # Confirmation page
		:auto_recur => true  # Tells WePay system to collect the :amount every :period.
})

puts response

# redirect user to response['checkout_uri']
# The above call depends in which web framework is being used (Rails, Padrino, etc)
