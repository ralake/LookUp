Given(/^that there is a flat roof and I am on Roof Angle page$/) do
  @roof = Roof.create
  visit("/roofs/#{@roof.id}/start")
  expect(page).to have_content("Angle your phone square-on to the roof to check which way it faces.")
end

When(/^I choose the flat roof option$/) do
  click_on("Flat")
end

Then(/^I go to the photo page$/) do
  expect(page).to have_content("Snap a picture of the building. Make sure the roof is visible!")
end

Given(/^that there is a sloped roof and I am on Roof Angle page$/) do
  @roof = Roof.create
  visit("/roofs/#{@roof.id}/start")
  expect(page).to have_content("Angle your phone square-on to the roof to check which way it faces.")
end

Then(/^I proceed to the next page$/) do
  click_on("Sloped")
  expect(page).to have_button("Capture")
end

Then(/^I angle my phone and move on to the next step$/) do
  click_on("Capture")
  expect(page).to have_content("Snap a picture of the building. Make sure the roof is visible!")
end
