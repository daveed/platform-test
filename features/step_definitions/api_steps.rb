Given(/^I send and accept JSON using Bearer "([^"]*)"$/) do |token|
  header 'Content-Type', 'application/json'
  header 'Authorization', "Bearer #{token}"
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

Then(/^the response token should be "([^"]*)"$/) do |body|
  expect(body).to eq('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxfQ.iuSIB-Zr-xT1DcXwoRGa67pBZnO54p-pI7iRbtJfBgKXMACFjs0dPnvJUsgnVwlZFSpN8CbRhrZ-2mraZ14zVw')
end

When(/^I do a PUT request to "([^"]*)" with:$/) do |path, body|
  put(path, body)
end

When(/^I do a DELETE request to "([^"]*)" with:$/) do |path, body|
  delete(path, body)
end
