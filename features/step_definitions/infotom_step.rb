Given(/^I am on infopage$/) do
  visit '/infopage'
end

When(/^I read information I want to move to next page$/) do
  expect(page).to have_content("Hi, I’m Tom Parker")
  click_link("Next")
end

Then(/^I should see take photo page$/) do
 expect(page).to have_content("Fuck off")
end
