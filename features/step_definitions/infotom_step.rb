Given(/^I am on infopage$/) do
  visit '/'
end

Then(/^I shoud see text about Tom Parker$/) do
  expect(page).to have_content("Hi, I’m Tom Parker")
end