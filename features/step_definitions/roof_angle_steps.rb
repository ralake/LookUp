Given(/^I am on Roof Angle page and my roof is flat$/) do
  visit '/roof_angle'
  expect(page).to have_content("Is your roof sloped or flat?")
end

When(/^I choose the flat roof option$/) do
  click_on "Flat"
end

Then(/^I go to the next page$/) do
  expect(page).to have_content("Summary")
end

Given(/^I am on Roof Angle page and my roof is sloped$/) do
  visit '/roof_angle'
  click_on "Sloped"
end

Then(/^I angle my phone and proceed to the next page$/) do
  click_on "Capture"
  expect(page).to have_content("Summary")
end

