Given(/^I am on the material page$/) do
  visit('/')
  click_on('Start')
  page.execute_script("show('pageNine');")
  expect(page).to have_content("What's the roof made of?")
end

When(/^I choose a roof material$/) do
  find("#metal").click
  click_on("OK, next")
end

Then(/^I should see the shading page$/) do
  expect(page).to have_content("Is there anything around that could cast a shadow on the roof?")
end