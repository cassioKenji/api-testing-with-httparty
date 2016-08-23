require '././beernivore/beernivore_app.rb'
require 'mock5'

Mock5.mount(@beernivore_api)

Given(/^a Beernivore API up and running$/) do
  Mock5.mounted_apis.class
end

When(/^I make a get in "([^"]*)"$/) do |route|
  @response = HTTParty.get("https://beernivore-api.com#{route}")
end

Then(/^it should return a response with a (\d+) response code$/) do |code|
  expect(@response.code).to eql(code.to_i)
end