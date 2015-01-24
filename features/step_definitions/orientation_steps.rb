Given(/^I am on the roof angle page$/) do
  visit '/roof_angle'
  expect(page).to have_content 'Roof Angle'
end

When(/^I happy with my compass position$/) do
  click_on 'Flat'
end

Then(/^I should be able to use app$/) do
  expect(page).to have_content 'Summary'
end