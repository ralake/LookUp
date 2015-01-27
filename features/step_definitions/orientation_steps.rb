Given(/^That there is a roof and I am on the roof angle page$/) do
  @roof = Roof.create
  visit "/roofs/#{@roof.id}/start"
  expect(page).to have_content 'Stand square on and point your phone directly at the building'
end

When(/^I am happy with my compass position$/) do
  click_on 'Flat'
end

Then(/^I should proceed to the next step$/) do
  expect(page).to have_content 'Stand nearby and square on to your building and take a photograph!'
end