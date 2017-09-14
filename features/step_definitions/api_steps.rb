Given(/^a user$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending
end

When(/^I do a POST request to \/v(\d+)\/users$/) do |arg1|
  pending
end

Given(/^valid credentials$/) do |table|
  @email = table.hashes.map { |r| r['email'] }.first
  @password = table.hashes.map { |r| r['password'] }.first
end

Then(/^the response status should be (\d+)$/) do |status|
  expect(last_response.status).to eq(status.to_i)
end
When(/^I do a POST request to "([^"]*)" with:$/) do |path, body|
  post(path, body)
end

When(/^I do a DELETE request to \/v(\d+)\/logout$/) do |arg1|
  pending
end

Given(/^a user and a token$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending
end

When(/^I do a POST request to the user id \/v(\d+)\/user\/(\d+)$/) do |arg1, arg2|
  pending
end

When(/^I do a DELETE request to \/v(\d+)\/user\/(\d+)$/) do |arg1, arg2|
  pending
end
