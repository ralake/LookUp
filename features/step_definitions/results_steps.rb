Given(/^I am on the results page$/) do
  visit '/result'
end

When(/^I have reviewed the results of the survey$/) do
  expect(page).to have_content("Estimated Solar Panel Capacity: 12")
  expect(page).to have_content("Estimated Output Power: 640")
end

Then(/^I should be able to have the results sent to me$/) do
  click_on 'Send Results'
  expect(current_url).to eq 'http://www.1010global.org/uk'
end