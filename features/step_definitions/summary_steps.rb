Given(/^I visit the summary page$/) do
  visit '/summary'
  expect(page).to have_content("Summary")
  fill_in 'title', with: "Test Site"
  fill_in 'discovered_by', with: "Test User"
end

When(/^I decide that my information is correct$/) do
  click_on "Save"
  expect(page).to have_content("Thank you Test User!")
end

Then(/^I should submit my email and finish the process$/) do
  fill_in 'email', with: "test@test.com"
  click_on 'Send Link'
  expect(current_url).to eq 'http://www.1010global.org/uk'
end