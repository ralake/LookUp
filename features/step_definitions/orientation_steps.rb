Given(/^I am on the orientation page$/) do
  visit('/')
  click_on('Start')
  page.execute_script("show('pageFive');")
  expect(page).to have_content("Angle your phone square-on")
end

When(/^I am happy with my compass position$/) do
  find('#topage_roof_type').click
end

Then(/^I should proceed to the next step$/) do
  expect(page).to have_content("Is the roof sloped or flat?")
end
