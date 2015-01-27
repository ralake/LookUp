Given(/^that there is a flat roof and I am on Roof Angle page$/) do
  @roof = Roof.create
  visit "/roofs/#{@roof.id}/start"
  expect(page).to have_content("Stand square on and point your phone directly at the building")
end

When(/^I choose the flat roof option$/) do
  click_on "Flat"
end

Then(/^I go to the photo page$/) do
  expect(page).to have_content("Stand nearby and square on to your building and take a photograph!")
end

Given(/^that there is a sloped roof and I am on Roof Angle page$/) do
  @roof = Roof.create
  visit "/roofs/#{@roof.id}/start"
  expect(page).to have_content("Stand square on and point your phone directly at the building")
end

Then(/^I proceed to the next page$/) do
  click_on "Sloped"
  expect(page).to have_button("Capture")
end

Then(/^I angle my phone and move on to the next step$/) do
  click_on "Capture"
  expect(page).to have_content("Stand nearby and square on to your building and take a photograph!")
end