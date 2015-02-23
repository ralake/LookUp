Given(/^I visit the homepage$/) do
  visit('/')
  expect(page).to have_content("A rooftop treasure hunt")
end

When(/^I decide to get started$/) do
  click_on('Start')
end

Then(/^I should see the first introductory page$/) do
  expect(page).to have_content("People everywhere are teaming up")
end
