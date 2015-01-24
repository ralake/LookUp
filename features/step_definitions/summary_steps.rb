Given(/^I am on the summary page$/) do
  visit '/summary'
end

When(/^I have read all the information and entered my details$/) do
  expect(page).to have_content("Summary Tiles 1 0")
  click_on("Save")
end

Then(/^I should see the thank you page$/) do
  expect(page).to have_content("Thank you!")
end
