Given(/^I am on the roof type page$/) do
  visit('/')
  click_on('Start')
  page.execute_script("show('pageSix')")
  expect(page).to have_content("Is the roof sloped or flat?")
end

When(/^I select flat roof$/) do
  find('#flatRoof').click
end

Then(/^I should see the photo page$/) do
  expect(page).to have_content("Snap a picture of the building")
end

When(/^I select sloped roof$/) do
  find('#slopedRoof').click
end

Then(/^I should see the roof angle page$/) do
  expect(page).to have_content("Let's check the angle of the roof")
end
