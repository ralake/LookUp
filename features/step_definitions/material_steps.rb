Given(/^I am on the material page$/) do
  visit 'roofs/:id/material'
  expect(page).to have_content("What does the roof look like it is made out of?")
end

When(/^I choose a roof material$/) do
  find("input[value='Tiles']").click
  click_on "Next"
end

Then(/^I should see the shading page$/) do
  expect(page).to have_content("Use the slider to estimate how much shade")
end
