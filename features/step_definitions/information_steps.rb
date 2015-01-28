Given(/^that there is a roof and I am on the get started page$/) do
  @roof = Roof.create
  visit("/roofs/#{@roof.id}/get_started")
end

When(/^I read information I want to move to next page$/) do
  expect(page).to have_content("Hi, I’m Tom Parker")
  click_link("Next")
end

Then(/^I should see the angle page$/) do
  expect(page).to have_content("Stand square on and point your phone directly at the building.")
end
