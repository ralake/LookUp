Given(/^I am on Roof Angle page and my roof is flat$/) do
  visit '/roof_angle'
  expect(page).to have_content("Roof Angle")
end

When(/^I choose the flat roof option$/) do
  click_on "Flat"
end

Then(/^I go to the next page$/) do
  expect(page).to have_content("Summary")
end
