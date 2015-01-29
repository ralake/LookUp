Given(/^That there is a roof and I am on the material page$/) do
  @roof = Roof.create
  visit("roofs/#{@roof.id}/material/edit")
  expect(page).to have_content("What's the roof made of?")
end

When(/^I choose a roof material$/) do
  find("input[value='Tiles']").click
  click_on("Next")
end

Then(/^I should see the shading page$/) do
  expect(page).to have_content("Is there anything around that could cast a shadow on the roof? Use the slider to record the shading.")
end
