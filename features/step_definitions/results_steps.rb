Given(/^That there is a roof and I on results page$/) do
  @roof = Roof.create(roof_angle: 0, gutter_edge: 20, angled_edge: 10, shade_value: 20, )
  visit("/roofs/#{@roof.id}/capacity/edit")
end

Then(/^I should see estimates fo solar panel and power capacity$/) do
  expect(page).to have_content("Estimated Solar Panel Capacity")  
end
