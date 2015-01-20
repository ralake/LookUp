Given(/^I am on shading page$/) do
  visit '/shading'
  expect(page).to have_content("Shading")
  expect(page).to have_content("Use the slider to estimate how much shade")
end

When(/^I choose shade value$/) do
  click_on("Next")
end

Then(/^I should see roof angle page$/) do
  pending # express the regexp above with the code you wish you had
end