Given(/^That there is a roof and I am on the roof angle page$/) do
  @roof = Roof.create
  visit("/roofs/#{@roof.id}/start")
  expect(page).to have_content('Angle your phone square-on to the roof to check which way it faces.')
end

When(/^I am happy with my compass position$/) do
  click_on('Flat')
end

Then(/^I should proceed to the next step$/) do
  expect(page).to have_content('Snap a picture of the building. Make sure the roof is visible!')
end
