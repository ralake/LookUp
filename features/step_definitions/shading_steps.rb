Given(/^I am on shading page$/) do
  visit('/')
  click_on('Start')
  page.execute_script("show('pageTen')")
  expect(page).to have_content("Is there anything around that could cast a shadow")
end

When(/^I choose a shade value$/) do
  fill_in("shade", with: "1")
  click_on("Next") 
end

Then(/^I should see the measurements page$/) do
  expect(page).to have_content("Here’s your roof – let’s measure it!")
end

