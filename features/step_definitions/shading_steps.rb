Given(/^I am on shading page$/) do
  visit '/shading'
  expect(page).to have_content("Shading")
  expect(page).to have_content("Use the slider to estimate how much shade")
end

When(/^I choose shade value$/) do
  click_on "Next"
end

Then(/^I should see roof angle page$/) do
  expect(page).to have_content("Roof Angle")
end

Given(/^I am on the shading page$/) do
  visit '/shading'
end

Given(/^I need more information$/) do
  click_on '#shade_info'
end

Then(/^I should see Tom's information$/) do

end