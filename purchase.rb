require 'active_merchant'
require 'rubygems'

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "harrisneo-facilitator_api1.gmail.com",
  :password => "URWKXX6222TXWXYL",
  :signature => "A.CSYz4u5IILQm5wM0J0JbJiIcEuA3byn6Q8cbPnGblr8WO42mnDx4l1"
)

credit_card = ActiveMerchant::Billing::CreditCard.new(
  :brand              => "visa",
  :number             => "4032032175899399",
  :verification_value => "982",
  :month              => 5,
  :year               => 2023,
  :first_name         => "Ryan",
  :last_name          => "Bates"
)

if credit_card.valid?
  # or gateway.purchase to do both authorize and capture
  response = gateway.authorize(1000, credit_card, :ip => "0.0.0.0")
  if response.success?
    gateway.capture(1000, response.authorization)
    puts "Purchase complete!"
  else
    puts "Error: #{response.message}"
  end
else
  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
end