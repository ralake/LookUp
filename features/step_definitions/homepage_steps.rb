Given(/^I visit the homepage$/) do
  visit '/roofs'
  expect(page).to have_content("Look Up")
end

When(/^I decide to get started$/) do
  click_link('Get started!')
end

Then(/^I should see the introductory page$/) do
  expect(page).to have_content("Tom Parker, Technical Director")
end
