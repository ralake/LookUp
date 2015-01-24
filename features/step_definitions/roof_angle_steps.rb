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
  expect(page).to have_content("Is your roof sloped or flat?")
end

Then(/^I proceed to the next page$/) do
  click_on "Sloped"
  expect(page).to have_button("Capture")
end

Then(/^I angle and proceed$/) do
  click_on "Capture"
  expect(page).to have_content("Summary")
end