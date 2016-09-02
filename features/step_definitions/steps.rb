Given(/^a Beernivore API up and running$/) do
  Mock5.mounted_apis
end

When(/^I make a get in "([^"]*)" with "([^"]*)" within the "([^"]*)" header$/) do |route, value, request_header|
  @response = HTTParty.get("https://beernivore.com#{route}", headers: { request_header.to_s => value.to_s })
end

Then(/^it's headers must contain the value "([^"]*)" within the "([^"]*)"$/) do |value, header|
  expect(@response.headers[header]).to eql(value)
end

When(/^the response body must contain a "([^"]*)" as the type$/) do |type|
  expect(@response.parsed_response.class.to_s).to eql(type)
end

Then(/^it should return a response with a (\d+) response code$/) do |code|
  expect(@response.code).to eql(code.to_i)
end

Then(/^it's body must contain the value "([^"]*)" within the "([^"]*)" for "([^"]*)"$/) do |value, att, here|
  expect(@response[here][att]).to eql(value)
end

Then(/^it's body must contain a Fixnum type within the "([^"]*)" for "([^"]*)"$/) do |att, here|
  expect(@response[here][att].class).to eql(Fixnum)
end
