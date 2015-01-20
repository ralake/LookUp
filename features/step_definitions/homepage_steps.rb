Given(/^I visit the homepage$/) do
  visit '/'
  expect(page).to have_content("Look Up")
end

When(/^I decide to get started$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the introductory page$/) do
  pending # express the regexp above with the code you wish you had
end

